{self, ...}: {
  flake.modules.nixos.profile-niri = {
    imports = with self.modules.nixos; [
      niri
      vicinae
    ];
  };

  flake.modules.homeManager.profile-niri = {
    imports = with self.modules.homeManager; [
      niri
      vicinae
      noctalia-shell
    ];
  };
}
