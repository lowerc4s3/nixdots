{
  config,
  lib,
  flake,
  ...
}:
let
  cfg = config.atoms.desktop.noctalia;
in
{
  imports = [
    ./bar.nix
    ./idle.nix
    ./session.nix
  ];

  options.atoms.desktop.noctalia = {
    enable = lib.mkEnableOption "noctalia shell";
  };

  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;

      settings = {
        shell = {
          # TODO
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
        };

        location.auto_locate = true;
        wallpaper.transition = "fade";
        desktop_widgets.enabled = false;
        weather.effects = false;

        control_center = {
          width = 800;
          sidebar_section = "none";
          hidden_tabs = [ "screen-time" ];
          shortcuts = [
            { type = "caffeine"; }
            { type = "nightlight"; }
            { type = "notification"; }
            { type = "session"; }
          ];
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
  };
}
