{
  flake.aspects.dev-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        gnumake
        cmakeMinimal
        gcc
        just
        jq
      ];
    };
  };
}
