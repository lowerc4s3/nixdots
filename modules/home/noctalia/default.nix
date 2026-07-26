{
  inputs,
  flake,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    ./stylix.nix
    ./bar.nix
    ./idle.nix
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      shell = {
        avatar_path = flake + /config/face.jpg;
        clipboard_enabled = false;
        launch_apps_as_systemd_services = true;
        animation.speed = 1.25;
        shadow.direction = "center";

        panel = {
          control_center_placement = "floating";
          open_near_click_control_center = true;
          open_near_click_session = true;
          session_placement = "floating";
          session_position = "center";
          wallpaper_placement = "floating";
        };

        session = {
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
      };

      location.auto_locate = true;
      wallpaper.transition = "fade";
      desktop_widgets.enabled = false;
      weather.effects = false;

      notification = {
        background_opacity = 1.0;
        # show above fullscreen apps
        layer = "overlay";
      };

      audio = {
        enable_sounds = true;
        sound_volume = 0.75;
      };

      osd = {
        background_opacity = 1.0;
        position = "bottom_right";
        kinds.media = false;
      };

      calendar = {
        enabled = true;
        refresh_minutes = 30;
      };
    };
  };
}
