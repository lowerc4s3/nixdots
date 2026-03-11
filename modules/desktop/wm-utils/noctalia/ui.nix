{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.ui = {
      boxBorderEnabled = true;
      panelsAttachedToBar = true;
      panelBackgroundOpacity = 1;
    };
  };
}
