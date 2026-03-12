{
  flake.aspects.desktop-core = {
    nixos = {
      # disable nix-manual desktop entry and html docs
      documentation.doc.enable = false;
    };
  };
}
