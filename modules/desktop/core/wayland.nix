{
  flake.aspects.desktop-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        wl-clipboard
      ];
    };
  };
}
