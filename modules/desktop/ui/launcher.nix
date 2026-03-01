{
  flake.modules.nixos.launcher = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vicinae
    ];
  };

  flake.modules.homeManager.launcher = {
    programs.vicinae = {
      enable = true;
    };
  };
}
