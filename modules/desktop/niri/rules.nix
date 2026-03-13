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
