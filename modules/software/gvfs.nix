{
  flake.modules.nixos.gvfs = {
    # TODO: move it elsewhere (mb file manager module)
    services.gvfs.enable = true;
  };
}
