{
  flake.modules.homeManager.niri-rules = let
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
}
