{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) nvx;
in {
  flake.modules.nixos.neovim = {
    programs.neovim = {
      enable = true;
      viAlias = lib.mkDefault true;
      vimAlias = lib.mkDefault true;
    };
  };

  flake.modules.homeManager.neovim = {pkgs, ...}: {
    home.packages = [nvx.packages.${pkgs.stdenv.system}.nvx];
    home.shellAliases = {
      v = "nvim";
    };
  };
}
