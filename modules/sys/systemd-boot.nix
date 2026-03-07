{
  flake.modules.nixos.sys-systemd-boot = {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
