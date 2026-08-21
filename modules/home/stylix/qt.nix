{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.stylix;
  inherit (config.stylix.fonts) sansSerif monospace sizes;
  palette = config.lib.stylix.colors {
    template = ./templates/qtcolors.conf.mustache;
    extension = ".conf";
  };

  qtctSettings = {
    Appearance = {
      custom_palette = true;
      color_scheme_path = "${palette}";
    };
    Fonts = {
      general = ''"${sansSerif.name},${toString sizes.applications}"'';
      fixed = ''"${monospace.name},${toString sizes.terminal}"'';
    };
  };
in
{
  config = lib.mkIf cfg.enable {
    stylix.targets.qt.enable = false;
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      qt5ctSettings = qtctSettings;
      qt6ctSettings = qtctSettings;
    };
  };
}
