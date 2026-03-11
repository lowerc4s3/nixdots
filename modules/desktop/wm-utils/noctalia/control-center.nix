{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.controlCenter = {
      cards = [
        {
          id = "profile-card";
          enabled = true;
        }
        {
          id = "shortcuts-card";
          enabled = true;
        }
        {
          id = "audio-card";
          enabled = true;
        }
        {
          id = "weather-card";
          enabled = false;
        }
        {
          id = "media-sysmon-card";
          enabled = false;
        }
      ];

      shortcuts.left = [
        {id = "KeepAwake";}
        {id = "PowerProfile";}
        {id = "Network";}
        {id = "WallpaperSelector";}
      ];
      shortcuts.right = [];
    };
  };
}
