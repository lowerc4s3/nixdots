{ pkgs, ... }:
let
  qtctSettings.Appearance = {
    icon_theme = "breeze-dark";
    standard_dialogs = "default";
    style = "Darkly";
  };
in
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt5ctSettings = qtctSettings;
    qt6ctSettings = qtctSettings;
    style.package = pkgs.darkly;
  };
}
