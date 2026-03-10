{
  flake.modules.homeManager.desktop-noctalia = {config, ...}: {
    programs.noctalia-shell.settings.wallpaper = {
      enabled = true;
      overviewEnabled = true;
      directory = "${config.home.homeDirectory}/Pictures/wallpapers/";
      setWallpaperOnAllMonitors = true;
      showHiddenFiles = true;
      viewMode = "recursive";
      transitionType = "fade";
    };
  };
}
