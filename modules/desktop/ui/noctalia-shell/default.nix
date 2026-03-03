{inputs, ...}: let
  inherit (inputs) noctalia;
in {
  flake.modules.homeManager.noctalia-shell = {
    imports = [
      noctalia.homeModules.default
    ];
    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
