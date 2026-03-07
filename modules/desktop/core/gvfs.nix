{
  flake.modules.nixos.desktop-core = {
    # TODO: move it elsewhere (mb file manager module)
    services.gvfs.enable = true;
  };
}
