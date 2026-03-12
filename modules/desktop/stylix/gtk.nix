{
  flake.aspects.desktop-stylix = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        adwaita-icon-theme
        adwaita-icon-theme-legacy
      ];
    };

    homeManager = {
      dconf.settings."org/gnome/desktop/wm/preferences" = {
        button-layout = ":close";
      };
    };
  };
}
