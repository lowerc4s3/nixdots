{ pkgs, config, ... }:
{
  stylix.targets.qt.enable = false;

  qt =
    let
      inherit (config.stylix) fonts icons;
      palette = config.lib.stylix.colors {
        template = ./qtcolors.conf.mustache;
        extension = ".conf";
      };
      qtctSettings = {
        Appearance = {
          icon_theme = icons.dark;
          standard_dialogs = "default";
          style = "Darkly";
          custom_palette = true;
          color_scheme_path = "${palette}";
        };
        Fonts = {
          general = ''"${fonts.sansSerif.name},${toString fonts.sizes.applications}"'';
          fixed = ''"${fonts.monospace.name},${toString fonts.sizes.terminal}"'';
        };
      };
    in
    {
      enable = true;
      platformTheme.name = "qtct";
      qt5ctSettings = qtctSettings;
      qt6ctSettings = qtctSettings;
      style.package = pkgs.darkly;
    };

}
