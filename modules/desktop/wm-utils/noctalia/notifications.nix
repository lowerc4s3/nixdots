{
  flake.aspects.desktop-noctalia.homeManager = {
    programs.noctalia-shell.settings.notifications = {
      enableKeyboardLayoutToast = true;
      respectExpireTimeout = true;
    };
  };
}
