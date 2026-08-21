{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.desktop.niri;
in
{
  imports = [
    ./binds.nix
    ./noctalia.nix
    ./rules.nix
    ./stylix.nix
  ];

  options.atoms.desktop.niri = {
    enable = lib.mkEnableOption "niri window compositor";
    withNoctalia = lib.mkEnableOption "noctalia integration for niri";
    displays = lib.mkOption {
      description = "Extra monitor configuration";
      type = with lib.types; attrsOf anything;
      default = { };
    };

    defaultApps = {
      terminal = lib.mkOption {
        description = "Terminal to open on Mod+Return bind";
        type = with lib.types; str;
      };

      browser = lib.mkOption {
        description = "Browser to open on Mod+B bind";
        type = with lib.types; str;
      };
    };
  };

  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    programs.niri.settings = {
      #
      # io
      #

      input = {
        mod-key = "Super";
        keyboard = {
          numlock = true;
          repeat-delay = 300;
          xkb = {
            layout = "us,ru";
            model = "pc104"; # ansi layout
            options = lib.join "," [
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

      outputs = cfg.displays;

      #
      # general
      #

      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
      clipboard.disable-primary = true;
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true; # disable window deco
      overview.zoom = 0.5;
      cursor.hide-when-typing = true;

      # fix discord/telegram/etc not focusing
      # when clicking on notif or tray icon
      debug.honor-xdg-activation-with-invalid-serial = true;

      #
      # layout
      #

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
  };
}
