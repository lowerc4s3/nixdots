{inputs, ...}: let
  shared = {
    # TODO: move nixpkgs config into perSystem
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
      # NOTE: this overlay fixes broken picosvg's tests which break jetbrains
      # mono build (see https://github.com/NixOS/nixpkgs/issues/493679)
      (final: prev: {
        pythonPackagesExtensions =
          prev.pythonPackagesExtensions
          ++ [
            (python-final: python-prev: {
              picosvg = python-prev.picosvg.overridePythonAttrs (oldAttrs: {
                doCheck = false;
              });
            })
          ];
      })
    ];
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
  flake.modules.nixos.nix-config = {
    imports = [
      shared
    ];
  };

  flake.modules.darwin.nix-config = {
    imports = [
      shared
    ];
  };
}
