{self, ...}: {
  flake.aspects.games-core = {
    nixos = {
      imports = with self.modules.nixos; [
        games-gamemode
        games-steam
      ];
    };

    homeManager = {
      imports = with self.modules.homeManager; [
        games-mangohud
      ];
    };
  };
}
