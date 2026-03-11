{inputs, ...}: {
  flake.modules.nixos.cli-core = {
    imports = [inputs.nix-index-database.nixosModules.default];

    # run programs without installing them
    programs.nix-index-database.comma.enable = true;
  };
}
