{self, ...}: {
  flake.modules.nixos.profile-niri = {
    imports = with self.modules.nixos; [
      niri
      launcher
    ];
  };

  flake.modules.homeManager.profile-niri = {
    imports = with self.modules.homeManager; [
      niri
      launcher
      noctalia-shell
    ];
  };
}
