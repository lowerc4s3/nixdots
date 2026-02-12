{self, ...}: {
  flake.modules.nixos.profile-gaming = {
    imports = with self.modules.nixos; [
      steam
      gamemode
    ];
  };
}
