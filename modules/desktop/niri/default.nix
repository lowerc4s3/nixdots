{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.desktop-niri = {
    imports = [inputs.niri.nixosModules.niri];
    nixpkgs.overlays = [inputs.niri.overlays.niri];
    programs.niri.enable = true;
    niri-flake.cache.enable = true;
  };

  flake.modules.homeManager.desktop-niri = {
    imports = with self.modules.homeManager; [
      desktop-vicinae
    ];
  };
}
