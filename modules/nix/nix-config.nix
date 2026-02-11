let
  shared = {
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
      experimental-features = ["flakes" "nix-command"];

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
