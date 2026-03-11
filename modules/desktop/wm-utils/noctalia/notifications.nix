{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.notifications = {
      enableKeyboardLayoutToast = true;
      respectExpireTimeout = true;
    };
  };
}
