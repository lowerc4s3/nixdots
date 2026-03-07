{self, ...}: {
  flake.modules.nixos.base-minimal = {
    imports = with self.modules.nixos; [
      nix-config
      home-manager
      sys-core
      cli-core
    ];
  };

  flake.modules.darwin.base-minimal = {
    imports = with self.modules.darwin; [
      nix-config
      sys-core
      cli-core
    ];
  };

  flake.modules.homeManager.base-minimal = {
    imports = with self.modules.homeManager; [
      cli-core
    ];
  };
}
