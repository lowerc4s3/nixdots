{self, ...}: {
  flake.modules.nixos.profile-base = {
    imports = with self.modules.nixos; [
      nix-config
      firmware
      network
      locale
      nix-ld
    ];
  };

  flake.modules.darwin.profile-base = {
    imports = with self.modules.darwin; [
      nix-config
      network
    ];
  };

  flake.modules.homeManager.profile-base = {
    imports = with self.modules.homeManager; [
    ];
  };
}
