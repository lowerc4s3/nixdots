{
  flake.modules.nixos.sys-ssd = {
    services.fstrim.enable = true;
  };
}
