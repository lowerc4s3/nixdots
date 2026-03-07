{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.sessionMenu = {
      enableCountdown = true;
      position = "bottom_left";
      largeButtonsStyle = false;
    };
  };
}
