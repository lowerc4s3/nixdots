{
  flake.modules.nixos.tealdeer = {pkgs, ...}: {
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
