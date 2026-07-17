{inputs, ...}: {
  flake.aspects.cli-core = {
    nixos = {pkgs, ...}: {
      imports = [inputs.nix-index-database.nixosModules.default];

      # run programs without installing them
      programs.nix-index-database.comma.enable = true;

      environment.systemPackages = with pkgs; [
        nix-output-monitor
      ];
    };
  };
}
