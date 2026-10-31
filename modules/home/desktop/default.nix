{
  flake,
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.desktop;
in
{
  imports = [
    flake.homeModules.cli
    flake.homeModules.apps
    flake.homeModules.stylix
    ./niri
    ./noctalia
    ./qt.nix
    ./vicinae.nix
  ];

  options.atoms.desktop = {
    enable = lib.mkEnableOption "the desktop management";
  };

  config = lib.mkIf cfg.enable {
    xdg = {
      enable = true;
      mimeApps.enable = true;

      userDirs = {
        enable = true;
        setSessionVariables = false;
        createDirectories = true;
      };
    };
  };
}
