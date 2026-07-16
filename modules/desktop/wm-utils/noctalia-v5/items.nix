{
  flake.aspects.desktop-noctalia-v5.homeManager = {
    programs.noctalia.settings = {
      control_center = {
        hidden_tabs = ["power" "network" "bluetooth" "screen-time"];
        sidebar = "compact";
        sidebar_section = "none";
        shortcuts = [
          {type = "caffeine";}
          {type = "nightlight";}
          {type = "notification";}
          {type = "session";}
        ];
      };

      calendar = {
        enabled = true;
        refresh_minutes = 30;
      };

      desktop_widgets.enabled = false;

      shell.panel = {
        control_center_placement = "floating";
        open_near_click_control_center = true;
        open_near_click_session = true;
        session_placement = "floating";
        session_position = "center";
        wallpaper_placement = "floating";
      };

      shell.session = {
        grid = true;
        actions = [
          {
            action = "lock";
            enabled = true;
            countdown_seconds = 0;
            shortcut = "1";
            variant = "default";
          }
          {
            action = "lock_and_suspend";
            enabled = true;
            countdown_seconds = 0;
            shortcut = "2";
            variant = "default";
          }
          {
            action = "logout";
            enabled = true;
            countdown_seconds = 5;
            shortcut = "3";
            variant = "default";
          }
          {
            action = "shutdown";
            enabled = true;
            countdown_seconds = 5;
            shortcut = "4";
            variant = "default";
          }
          {
            action = "reboot";
            enabled = true;
            countdown_seconds = 5;
            shortcut = "5";
            variant = "default";
          }
        ];
      };

      weather.effects = false;
    };
  };
}
