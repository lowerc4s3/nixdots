{self, ...}: {
  flake.modules.nixos.desktop-niri-with-noctalia = {
    imports = with self.modules.nixos; [
      desktop-niri
      desktop-nautilus
    ];
  };

  flake.modules.homeManager.desktop-niri-with-noctalia = {
    imports = with self.modules.homeManager; [
      desktop-niri
      desktop-noctalia
    ];
    programs.niri.settings = {
      layer-rules = [
        {
          matches = [{namespace = "^noctalia-overview*";}];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
