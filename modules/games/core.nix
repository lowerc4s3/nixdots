{self, ...}: {
  flake.modules.nixos.games-core = {
    imports = with self.modules.nixos; [
      games-gamemode
      games-steam
    ];
  };

  flake.modules.homeManager.games-core = {
    imports = with self.modules.homeManager; [
      games-mangohud
    ];
  };
}
