{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.ui = {
      boxBorderEnabled = true;
      panelBackgroundOpacity = 1;
      panelsAttachedToBar = true;
    };
  };
}
