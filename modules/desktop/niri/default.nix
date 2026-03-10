{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.desktop-niri = {pkgs, ...}: {
    imports = [inputs.niri.nixosModules.niri];
    nixpkgs.overlays = [inputs.niri.overlays.niri];
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
  };

  flake.modules.homeManager.desktop-niri = {
  };
}
