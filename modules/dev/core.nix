{
  flake.aspects.dev-core.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gnumake
      cmakeMinimal
      just
      jq
    ];
  };
}
