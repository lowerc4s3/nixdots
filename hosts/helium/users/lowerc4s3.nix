{
  flake,
  lib,
  pkgs,
  perSystem,
  ...
}:
{
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  imports = [
    flake.homeModules.desktop
  ];

  atoms = {
    cli = {
      enable = true;
      bat.enable = true;
      eza.enable = true;
      lf.enable = true;
      shell = {
        abbrs.v = "nvim";
        fish.enable = true;
      };
    };

    desktop.enable = false;
    stylix.enable = false;

    apps = {
      librewolf.enable = true;
      neovide.enable = true;
      zathura.enable = true;
    };
  };

  home.packages = with pkgs; [
    perSystem.nvx.nvx
    ripgrep
    fd
  ];

  stylix.autoEnable = lib.mkForce false;
  home.sessionVariables.EDITOR = "nvim";
}
