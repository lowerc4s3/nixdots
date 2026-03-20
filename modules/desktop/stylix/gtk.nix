{
  flake.aspects.desktop-stylix = {
    nixos = {pkgs, ...}: {
      programs.dconf.enable = true;
      environment.systemPackages = with pkgs; [
        gtk3
        adwaita-icon-theme
        adwaita-icon-theme-legacy
      ];
      environment.variables = {
        GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
      };
    };

    homeManager = {
      dconf.settings."org/gnome/desktop/wm/preferences" = {
        button-layout = ":close";
      };
    };
  };
}
