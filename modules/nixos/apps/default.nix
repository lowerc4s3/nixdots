{ flake, ... }:
{
  imports = [
    ./clash-verge.nix
    ./iloader.nix
    ./nautilus.nix
    ./steam.nix
  ];

  home-manager.sharedModules = [ flake.homeModules.apps ];
}
