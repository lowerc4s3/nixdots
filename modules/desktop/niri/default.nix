{inputs, ...}: {
  flake.aspects.desktop-niri.nixos = {pkgs, ...}: {
    imports = [inputs.niri.nixosModules.niri];
    nixpkgs.overlays = [inputs.niri.overlays.niri];
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
  };
}
