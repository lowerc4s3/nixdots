{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings = {
      settingsVersion = 54;
      general = {
        language = "en";
        telemetryEnabled = false;
        # TODO: move to options
        avatarImage = ./face.jpg;
        enableShadows = false;
        enableLockScreenCountdown = false;
        clockStyle = "digital";

        dimmerOpacity = 0.0;
        showScreenCorners = false;
        radiusRatio = 0.55;
        animationSpeed = 1.25;
        shadowDirection = "center";

        showHibernateOnLockScreen = false;
      };

      idle = {
        enabled = true;
        suspendTimeout = 0;
      };

      dock.enabled = false;
      desktopWidgets.enabled = false;
      audio.visualizerType = "none";

      launcher = {
        enableSessionSearch = false;
        enableSettingsSearch = false;
        enableWindowsSearch = false;
      };
    };
  };
}
