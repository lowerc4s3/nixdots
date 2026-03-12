{
  flake.aspects.desktop-noctalia = {
    homeManager = {
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

        appLauncher = {
          position = "center";
          terminalCommand = "foot --";
          viewMode = "list";
          density = "comfortable";
          showCategories = false;
          overviewLayer = true;

          enableSettingsSearch = false;
          enableSessionSearch = true;
          enableWindowsSearch = true;
        };

        colorSchemes = {
          useWallpaperColors = true;
          generationMethod = "tonal-spot";
        };
      };
    };
  };
}
