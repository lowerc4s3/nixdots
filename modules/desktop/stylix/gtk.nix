{
  flake.modules.nixos.desktop-stylix = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      adwaita-icon-theme-legacy
    ];
  };

  flake.modules.homeManager.desktop-stylix = {
    dconf.settings."org/gnome/desktop/wm/preferences" = {
      button-layout = ":close";
    };
  };
}
