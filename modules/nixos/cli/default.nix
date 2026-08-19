{
  lib,
  config,
  pkgs,
  flake,
  ...
}:
let
  cfg = config.atoms.cli;
in
{
  imports = [
    flake.nixosModules.system
    ./nix-tools.nix
  ];

  options.atoms.cli = {
    enable = lib.mkEnableOption "basic cli tools";
  };

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [ flake.homeModules.cli ];

    environment.systemPackages = with pkgs; [
      fd
      ripgrep
      psmisc
      file
      git
    ];

    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
  };
}
