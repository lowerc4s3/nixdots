{
  flake.aspects.cli-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        psmisc
      ];
    };
  };
}
