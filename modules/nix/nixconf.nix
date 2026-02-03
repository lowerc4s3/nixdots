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
  flake.modules.nixos.nixconf = {
    imports = [
      shared
    ];

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 14d";
      };
    };
  };

  flake.modules.darwin.nixconf = {pkgs, ...}: {
    imports = [
      shared
    ];

    environment.systemPackages = with pkgs; [
      nh
    ];
  };
}
