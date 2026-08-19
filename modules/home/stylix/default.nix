{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.stylix;
in
{
  imports = [
    ./qt.nix
  ];

  options.atoms.stylix = {
    enable = lib.mkEnableOption "colors and fonts management with stylix";
  };

  config = lib.mkIf cfg.enable {
    stylix.autoEnable = true;

    home = {
      pointerCursor.enable = true;

      packages = with pkgs; [
        adwaita-icon-theme
        adwaita-icon-theme-legacy
        kdePackages.breeze-icons
      ];

      sessionVariables = {
        GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
      };
    };

    dconf.settings."org/gnome/desktop/wm/preferences" = {
      button-layout = ":close";
    };
  };
}
