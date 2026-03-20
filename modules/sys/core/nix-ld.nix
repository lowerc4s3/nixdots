{
  flake.aspects.sys-core = {
    nixos = {
      programs.nix-ld = {
        enable = true;
      };
    };
  };
}
