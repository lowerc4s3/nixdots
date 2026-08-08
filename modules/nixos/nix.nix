{
  inputs,
  pkgs,
  lib,
  perSystem,
  ...
}:
{
  imports = with inputs; [
    nix-index-database.nixosModules.default
    nixos-cli.nixosModules.nixos-cli
  ];

  nixpkgs.overlays = [
    # use latest nix version
    (final: prev: { nix = prev.nixVersions.latest; })
  ];

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
      trusted-users = [ "@wheel" ];
      auto-optimise-store = true;
    };
  };

  # run programs without installing them
  programs.nix-index-database.comma.enable = true;

  programs.nixos-cli = {
    enable = true;
    # use system nix package
    package = perSystem.nixos-cli.nixos-cli.override { inherit (pkgs) nix; };
    option-cache.enable = false;
    settings = {
      apply = {
        reexec_as_root = true;
        use_nom = true;
      };
      differ = {
        tool = "command";
        command = [ (lib.getExe pkgs.dix) ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];
}
