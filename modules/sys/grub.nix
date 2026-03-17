{
  flake.aspects.sys-grub = {
    nixos = {pkgs, ...}: {
      boot.loader = {
        efi.canTouchEfiVariables = true;
        timeout = 20;
        grub = let
          theme = pkgs.minimal-grub-theme;
        in {
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
  };
}
