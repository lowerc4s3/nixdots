{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.niri = let
    inherit (inputs) niri;
  in {
    imports = [niri.nixosModules.niri];
    nixpkgs.overlays = [niri.overlays.niri];
    programs.niri.enable = true;
    niri-flake.cache.enable = true;
  };

  flake.modules.homeManager.niri = {
    imports = with self.modules.homeManager; [
      niri-binds
      niri-io
      niri-layout
      niri-misc
      niri-rules
    ];
  };
}
