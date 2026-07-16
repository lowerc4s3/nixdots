{
  flake.aspects.desktop-noctalia-v5.homeManager = {config, ...}: {
    programs.noctalia.settings = let
      inherit (config.stylix) fonts;
    in {
      shell = {
        avatar_path = ./face.jpg;
        clipboard_enabled = false;
        font_family = fonts.sansSerif.name;
        launch_apps_as_systemd_services = true;
        animation.speed = 1.25;
        shadow.direction = "center";
      };

      notification = {
        background_opacity = 1.0;
        # show above fullscreen apps
        layer = "overlay";
      };

      audio = {
        enable_sounds = true;
        sound_volume = 0.75;
      };

      idle = {
        behavior_order = ["screen-off" "lock" "lock-and-suspend"];
        behavior.screen-off = {
          action = "screen_off";
          enabled = true;
          timeout = 300.0;
        };
        behavior.lock = {
          action = "lock";
          enabled = true;
          timeout = 600.0;
        };
        behavior.lock-and-suspend = {
          action = "lock_and_suspend";
          enabled = true;
          timeout = 900.0;
        };
      };

      # location for weather
      location.auto_locate = true;

      osd = {
        background_opacity = 1.0;
        position = "bottom_right";
        kinds.media = false;
      };

      wallpaper.transition = "fade";

      # niri backdrop
      backdrop = {
        blur_intensity = 0.75;
        enabled = true;
      };
    };
  };
}
