{
  flake.aspects = {aspects, ...}: {
    desktop-niri-with-noctalia-v5 = {
      includes = with aspects; [
        desktop-niri
        desktop-nautilus
        desktop-noctalia-v5
        desktop-vicinae
      ];

      homeManager = {lib, ...}: {
        programs.niri.settings = {
          binds = let
            noctalia = cmd: ["noctalia" "msg"] ++ (lib.splitString " " cmd);
          in {
            "Mod+Space" = {
              action.spawn = ["vicinae" "toggle"];
              repeat = false;
            };
            "Mod+Shift+Space" = {
              action.spawn = noctalia "panel-toggle launcher";
              repeat = false;
            };
            "Mod+Shift+M" = {
              action.spawn = noctalia "panel-toggle session";
              repeat = false;
            };
          };

          layer-rules = [
            {
              matches = [{namespace = "^noctalia-backdrop*";}];
              place-within-backdrop = true;
            }
          ];
        };
      };
    };
  };
}
