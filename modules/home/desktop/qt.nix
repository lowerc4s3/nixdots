{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.desktop;
  qtctSettings.Appearance = {
    icon_theme = "breeze-dark";
    standard_dialogs = "default";
    style = "Darkly";
  };
in
{
  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      qt5ctSettings = qtctSettings;
      qt6ctSettings = qtctSettings;
      style.package = pkgs.darkly;
    };
  };
}
