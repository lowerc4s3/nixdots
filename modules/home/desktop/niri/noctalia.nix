{
  config,
  lib,
  flake,
  ...
}:
let
  cfg = config.atoms.desktop.niri;
  inherit (flake.lib) mkCmd;
  noctalia = args: mkCmd "noctalia msg ${args}";
in
{
  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable && cfg.withNoctalia) {
    atoms = {
      desktop = {
        noctalia.enable = true;
        vicinae.enable = true;
        niri.defaultApps.terminal = "footclient";
      };

      apps.foot.enable = true;
    };

    programs.niri.settings = {
      binds = {
        "Mod+Space" = {
          action.spawn = mkCmd "vicinae toggle";
          repeat = false;
        };
        "Mod+Shift+M" = {
          action.spawn = noctalia "panel-toggle session";
          repeat = false;
        };
        "Mod+Shift+N" = {
          action.spawn = noctalia "panel-toggle control-center notifications";
          repeat = false;
        };
      };

      layer-rules = lib.singleton {
        matches = [ { namespace = "^noctalia-backdrop*"; } ];
        place-within-backdrop = true;
      };
    };

    xdg.mimeApps.defaultApplications = {
      "inode/directory" = "org.gnome.Nautilus.desktop";
    };

    # niri backdrop
    programs.noctalia.settings.backdrop = {
      blur_intensity = 0.75;
      enabled = true;
    };
  };
}
