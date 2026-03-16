{
  flake.aspects.apps-onlyoffice = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        onlyoffice-desktopeditors
      ];
    };
  };
}
