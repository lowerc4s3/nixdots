{inputs, ...}: {
  flake.aspects.cli-core = {
    nixos = {
      imports = [inputs.nix-index-database.nixosModules.default];

      # run programs without installing them
      programs.nix-index-database.comma.enable = true;
    };
  };
}
