{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.system.plymouth;
in
{
  options.atoms.system.plymouth = {
    enable = lib.mkEnableOption "the plymouth boot splash screen";
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    boot.plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = [ pkgs.nixos-bgrt-plymouth ];
    };
  };
}
