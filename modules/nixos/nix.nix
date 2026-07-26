{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix-index-database.nixosModules.default];

  nixpkgs.overlays = [
    # use latest nix version
    (final: prev: {nix = prev.nixVersions.latest;})
  ];

  # run programs without installing them
  programs.nix-index-database.comma.enable = true;

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["flakes" "nix-command" "pipe-operators"];
      trusted-users = ["@wheel"];
      auto-optimise-store = true;
    };
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];
}
