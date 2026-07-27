{
  lib,
  flake,
  pkgs,
  perSystem,
  ...
}:
let
  inherit (lib) join getExe;
  inherit (flake.lib) mkCmd;
in
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./stylix.nix
  ];

  programs.niri.settings = {
    #
    # keyboard and mouse
    #
    input = {
      mod-key = "Super";
      keyboard = {
        numlock = true;
        repeat-delay = 300;
        xkb = {
          layout = "us,ru";
          model = "pc104"; # ansi layout
          options = join "," [
            "grp:alt_space_toggle"
            "compose:ralt"
            "caps:escape" # use capslock as an escape button
          ];
        };
      };

      mouse.accel-profile = "flat";
      warp-mouse-to-focus.enable = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "10%";
      };
    };

    #
    # general
    #
    clipboard.disable-primary = true;
    hotkey-overlay.skip-at-startup = true;
    xwayland-satellite.path = getExe pkgs.xwayland-satellite;
    prefer-no-csd = true; # disable window deco
    overview.zoom = 0.5;
    cursor.hide-when-typing = true;
    environment = {
      # Enable wayland for glfw
      XDG_SESSION_TYPE = "wayland";
      # Qt fallback to X11
      QT_QPA_PLATFORM = "wayland;xcb";
      # Disable Qt window decorations
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      # Use theme from qt6ct
      QT_QPA_PLATFORMTHEME = "qt6ct";
      # GTK fallback to X11 or another backend
      GDK_BACKEND = "wayland,x11,*";
    };

    # fix discord/telegram/etc not focusing
    # when clicking on notif or tray icon
    debug.honor-xdg-activation-with-invalid-serial = [ ];

    #
    # layout
    #
    spawn-at-startup = [
      { argv = mkCmd "${getExe perSystem.self.oniri} --tiling-layout"; }
    ];

    layout = {
      empty-workspace-above-first = true;
      always-center-single-column = true;
      default-column-width.proportion = 1. / 2.;
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
      ];

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        length.total-proportion = 0.98;
        gap = 10;
        width = 5;
        gaps-between-tabs = 5;
        corner-radius = 10;
      };

      focus-ring.width = 1;
      gaps = 10;
      struts = {
        left = 25;
        right = 25;
        top = 15;
        bottom = 15;
      };
    };
  };
}
