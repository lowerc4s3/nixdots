{
  flake.aspects.apps-social = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        telegram-desktop
      ];
    };
  };
}
