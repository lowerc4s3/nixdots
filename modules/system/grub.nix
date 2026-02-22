{inputs, ...}: {
  flake.modules.nixos.grub = {
    config,
    pkgs,
    ...
  }: {
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

    imports = [
      # HACK: very dirty way to pass the system, but works for now
      # (its not my fault that the flake author made the module system dependant)
      inputs.distro-grub-themes.nixosModules."x86_64-linux".default
    ];
    distro-grub-themes = {
      enable = true;
      theme = "gigabyte";
    };
  };
}
