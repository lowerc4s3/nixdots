{inputs, ...}: {
  flake.aspects.nix-config = {
    nixos = {
      # TODO: move nixpkgs config into perSystem
      nixpkgs = {
        config.allowUnfree = true;
        overlays = [
          # use latest nix version
          (final: prev: {nix = prev.nixVersions.latest;})
        ];
      };
      nix = {
        nixPath = ["nixpkgs=${inputs.nixpkgs}"];
        settings = {
          experimental-features = ["flakes" "nix-command" "pipe-operators"];
          trusted-users = ["lowerc4s3"];
          auto-optimise-store = true;
        };
      };
    };
  };
}
