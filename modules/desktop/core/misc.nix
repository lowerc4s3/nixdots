{
  flake.modules.nixos.desktop-core = {
    # disable nix-manual desktop entry and html docs
    documentation.doc.enable = false;
  };
}
