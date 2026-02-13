{self, ...}: {
  flake.modules.nixos.profile-gaming = {
    imports = with self.modules.nixos; [
      steam
      gamemode
      mangohud
    ];
  };

  flake.modules.homeManager.profile-gaming = {
    imports = with self.modules.homeManager; [
      mangohud
    ];
  };
}
