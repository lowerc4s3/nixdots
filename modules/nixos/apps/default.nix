{ flake, ... }:
{
  imports = [
    ./clash-verge.nix
    ./steam.nix
  ];

  home-manager.sharedModules = [ flake.homeModules.apps ];
}
