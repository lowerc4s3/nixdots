{
  flake.modules.nixos.cli-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      tealdeer
    ];
  };

  flake.modules.homeManager.tealdeer = {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = false;
    };
  };
}
