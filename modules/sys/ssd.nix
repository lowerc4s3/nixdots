{
  flake.aspects.sys-ssd.nixos = {
    services.fstrim.enable = true;
  };
}
