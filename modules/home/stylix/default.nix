{ pkgs, ... }:
{
  home = {
    pointerCursor.enable = true;
    packages = with pkgs; [
      adwaita-icon-theme
      adwaita-icon-theme-legacy
      kdePackages.breeze-icons
    ];
    sessionVariables.GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = ":close";
  };

  stylix.autoEnable = true;

  imports = [
    ./targets.nix
    ./qt
    ./foot.nix
    ./niri.nix
    ./noctalia.nix
  ];
}
