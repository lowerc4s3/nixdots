{
  flake.aspects.cli-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        tealdeer
      ];
    };

    homeManager = {
      programs.tealdeer = {
        enable = true;
        enableAutoUpdates = false;
      };
    };
  };
}
