{
  description = "lowerc4s3 nix systems";

  inputs = {
    #
    # nix utils
    #
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-qb.url = "github:NixOS/nixpkgs/0e9e7de81eedaab584de143f4d200c4829f0b9a2";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-aspects.url = "github:vic/flake-aspects";
    import-tree.url = "github:vic/import-tree";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #
    # shared
    #
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #
    # nixos
    #
    niri.url = "github:sodiboo/niri-flake";
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({lib, ...}: {
      imports = [(inputs.import-tree.filterNot (lib.hasInfix "hardware-configuration") ./modules)];
    });
}
