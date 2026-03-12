{
  flake.aspects.desktop-noctalia = {
    homeManager = {
      programs.noctalia-shell.settings.ui = {
        boxBorderEnabled = true;
        panelsAttachedToBar = true;
        panelBackgroundOpacity = 1;
      };
    };
  };
}
