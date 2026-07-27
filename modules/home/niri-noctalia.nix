{ flake, ... }: {
  imports = with flake.homeModules; [
    niri
    noctalia
    vicinae
    foot
  ];

  programs.niri.settings =
    let
      inherit (flake.lib) mkCmd;
      noctalia = args: mkCmd "noctalia msg ${args}";
    in
    {
      binds = {
        "Mod+Space" = {
          action.spawn = mkCmd "vicinae toggle";
          repeat = false;
        };
        "Mod+Shift+M" = {
          action.spawn = noctalia "panel-toggle session";
          repeat = false;
        };
      };

      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-backdrop*"; } ];
          place-within-backdrop = true;
        }
      ];
    };

  # niri backdrop
  programs.noctalia.settings.backdrop = {
    blur_intensity = 0.75;
    enabled = true;
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
  };
}
