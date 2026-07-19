{
  flake.aspects.desktop-noctalia.homeManager = {
    programs.noctalia.settings = {
      bar.default = {
        position = "left";
        margin_ends = 0;
        padding = 10;
        widget_spacing = 16;
        radius_bottom_left = 0;
        radius_top_left = 0;

        # items
        start = ["workspaces"];
        center = ["clock"];
        end = ["tray" "keyboard_layout" "volume" "notifications" "control-center"];
      };

      widget = {
        clock = {
          font_family = "Lilex Nerd Font";
          tooltip_format = "%c";
          vertical_format = ''%H\n%M\n—\n%d\n%m'';
        };

        keyboard_layout = {
          hide_when_single_layout = true;
          show_icon = false;
        };

        workspaces = {
          pill_scale = 0.75;
          active_pill_size = 2.6;
          display = "none";
          empty_color = "on_surface";
          occupied_color = "on_surface";
        };

        tray.drawer = true;
        volume.show_label = false;
        control-center.glyph = "layout";
      };
    };
  };
}
