{
  flake.aspects.games-minecraft = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        prismlauncher
      ];
    };
  };
}
