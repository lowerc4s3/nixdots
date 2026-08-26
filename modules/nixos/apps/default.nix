{ flake, ... }:
{
  imports = [
    ./clash-verge.nix
    ./iloader.nix
    ./steam.nix
  ];

  home-manager.sharedModules = [ flake.homeModules.apps ];
}
