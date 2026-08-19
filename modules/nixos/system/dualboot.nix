{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.system.dualboot;
in
{
  options.atoms.system.dualboot = {
    enable = lib.mkEnableOption "Windows dualboot setup";
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    boot.supportedFilesystems = [ "ntfs" ];
    boot.loader = {
      efi.canTouchEfiVariables = lib.mkDefault true;
      systemd-boot.enable = false;
      grub =
        let
          theme = pkgs.minimal-grub-theme;
        in
        {
          enable = true;
          device = "nodev";
          efiSupport = true;
          useOSProber = true;
          # select last booted entry by default
          default = "saved";
          configurationLimit = 50;

          inherit theme;
          splashImage = "${theme}/background.png";
        };
    };
  };
}
