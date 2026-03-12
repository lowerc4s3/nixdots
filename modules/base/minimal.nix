{self, ...}: {
  flake.aspects.base-minimal = {
    includes = with self.aspects; [
      nix-config
      home-manager
      sys-core
      cli-core
    ];
  };
}
