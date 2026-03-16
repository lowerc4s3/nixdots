{
  flake.aspects.desktop-core = {
    nixos = {
      services = {
        udisks2.enable = true;
        gvfs.enable = true;
      };
    };
  };
}
