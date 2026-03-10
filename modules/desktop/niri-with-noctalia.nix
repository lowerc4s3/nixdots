{self, ...}: {
  flake.modules.nixos.desktop-niri-with-noctalia = {
    imports = with self.modules.nixos; [
      desktop-niri
      desktop-nautilus
    ];
  };

  flake.modules.homeManager.desktop-niri-with-noctalia = {lib, ...}: {
    imports = with self.modules.homeManager; [
      desktop-niri
      desktop-noctalia
    ];
    programs.niri.settings = {
      spawn-at-startup = [
        {argv = ["noctalia-shell"];}
      ];

      binds = let
        noctalia = cmd: ["noctalia-shell" "ipc" "call"] ++ (lib.splitString " " cmd);
      in {
        "Alt+Space" = {
          action.spawn = noctalia "launcher toggle";
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
}
