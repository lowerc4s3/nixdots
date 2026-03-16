{
  flake.aspects.desktop-niri = {
    homeManager = let
      allCorners = radius: {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
    in {
      programs.niri.settings = {
        window-rules = [
          {
            # rounded corners for all windows
            matches = [];
            geometry-corner-radius = allCorners 10.;
            clip-to-geometry = true;
          }

          {
            matches = [{app-id = "^cs2$";}];
            variable-refresh-rate = true;
          }

          {
            matches = [
              {
                app-id = "steam";
                title = "^Список друзей$";
              }
            ];
            default-column-width.proportion = 1. / 5.;
          }

          {
            # move steam notifications in the bottom right corner
            matches = [
              {
                app-id = "steam";
                title = "^notificationtoasts_.+_desktop$";
              }
            ];
            open-focused = false;
            default-floating-position = {
              x = 10;
              y = 10;
              relative-to = "bottom-right";
            };
          }

          {
            matches = [{app-id = "^VirtualBox Machine$";}];
            open-fullscreen = true;
          }
        ];

        layer-rules = [
          {
            matches = [{namespace = "^vicinae$";}];
            shadow.enable = true;
            geometry-corner-radius = allCorners 10.;
          }
        ];
      };
    };
  };
}
