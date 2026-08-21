{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.desktop;
in
{
  imports = [
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
