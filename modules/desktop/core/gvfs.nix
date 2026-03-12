{
  flake.aspects.desktop-core = {
    nixos = {
      # TODO: move it elsewhere (mb file manager module)
      services.gvfs.enable = true;
    };
  };
}
