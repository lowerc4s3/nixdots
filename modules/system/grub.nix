{
  flake.modules.nixos.grub = {pkgs, ...}: {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      timeout = 20;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        # select last booted entry by default
        default = "saved";
        configurationLimit = 50;
      };
    };
  };
}
