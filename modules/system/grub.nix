{
  flake.modules.nixos.grub = {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      timeout = 20;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        # select last booted entry by default
        default = "saved";
        configurationLimit = 50;
      };
    };
  };
}
