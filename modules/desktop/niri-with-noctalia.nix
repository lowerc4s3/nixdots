{
  flake.aspects = {aspects, ...}: {
    desktop-niri-with-noctalia = {
      includes = with aspects; [
        desktop-niri
        desktop-nautilus
        desktop-noctalia
        desktop-vicinae
      ];

      homeManager = {lib, ...}: {
        programs.niri.settings = {
          spawn-at-startup = [
            {argv = ["noctalia-shell"];}
          ];

          binds = let
            noctalia = cmd: ["noctalia-shell" "ipc" "call"] ++ (lib.splitString " " cmd);
          in {
            "Alt+Space" = {
              action.spawn = ["vicinae" "toggle"];
              repeat = false;
            };
            "Mod+Shift+M" = {
              action.spawn = noctalia "sessionMenu toggle";
              repeat = false;
            };
          };

          layer-rules = [
            {
              matches = [{namespace = "^noctalia-overview*";}];
              place-within-backdrop = true;
            }
          ];
        };
      };
    };
  };
}
