{
  inputs,
  self,
  ...
}: let
  inherit (inputs) noctalia;
in {
  flake.modules.homeManager.noctalia-shell = {
    imports = with self.modules.homeManager; [
      noctalia.homeModules.default
      noctalia-niri-backdrop-sync
    ];
    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
