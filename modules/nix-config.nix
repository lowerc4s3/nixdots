{inputs, ...}: {
  flake.aspects.nix-config = let
    module = {
      # TODO: move nixpkgs config into perSystem
      nixpkgs.config.allowUnfree = true;
      nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      nix.settings = {
        experimental-features = ["flakes" "nix-command" "pipe-operators"];

        trusted-users = ["lowerc4s3"];

        # Detect duplicate files in nix store
        # and replace them with hard links
        auto-optimise-store = true;
      };
    };
  in {
    nixos = module;
    darwin = module;
  };
}
