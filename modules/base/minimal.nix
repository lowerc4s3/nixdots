{
  flake.aspects = {aspects, ...}: {
    base-minimal.includes = with aspects; [
      nix-config
      home-manager
      sys-core
      cli-core
    ];
  };
}
