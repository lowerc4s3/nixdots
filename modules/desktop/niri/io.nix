{
  flake.aspects.desktop-niri.homeManager = {lib, ...}: {
    programs.niri.settings.input = {
      mod-key = "Super";
      keyboard = {
        numlock = true;
        repeat-delay = 300;
        xkb = {
          layout = "us,ru";
          model = "pc104"; # ansi layout
          options = lib.join "," [
            "grp:win_space_toggle"
            "compose:ralt"
            "caps:escape" # use capslock as an escape button
          ];
        };
      };

      mouse = {
        accel-profile = "flat";
      };

      warp-mouse-to-focus.enable = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "10%";
      };
    };

    programs.niri.settings.outputs."DP-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 144.0;
      };
      variable-refresh-rate = "on-demand";
    };
  };
}
