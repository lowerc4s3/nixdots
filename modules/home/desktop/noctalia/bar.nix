{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.desktop.noctalia;
in
{
  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    programs.noctalia.settings = {
      bar.default = {
        position = "left";
        margin_ends = 0;
        padding = 10;
        widget_spacing = 16;
        radius_bottom_left = 0;
        radius_top_left = 0;
        dead_zone.actions.right = "none";

        # items
        start = [ "workspaces" ];
        center = [ "clock" ];
        end = [
          "tray"
          "group:system_controls"
          "control-center"
        ];

        capsule_group = [
          {
            enabled = true;
            id = "system_controls";
            members = [
              "keyboard_layout"
              "volume"
              "notifications"
            ];
          }
        ];
      };

      widget = {
        clock = {
          font_family = "Adwaita Mono";
          tooltip_format = "%c";
          vertical_format = ''%H\n%M\n—\n%d\n%m'';
        };

        keyboard_layout = {
          hide_when_single_layout = true;
          show_glyph = false;
        };

        workspaces = {
          pill_scale = 0.75;
          active_pill_size = 0.75;
          inactive_pill_size = 0.25;
          show_labels = false;
          empty_color = "on_surface";
          occupied_color = "on_surface";
        };

        tray = {
          capsule = true;
          drawer = true;
        };

        volume.show_label = false;
        control-center.glyph = "layout";
      };
    };
  };
}
