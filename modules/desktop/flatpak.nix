{
  flake.aspects.desktop-flatpak = {
    nixos = {
      services.flatpak.enable = true;
      # TODO: nix-flatpak for declarative mgmt
    };
  };
}
