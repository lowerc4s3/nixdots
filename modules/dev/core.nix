{
  flake.modules.nixos.dev-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gnumake
      cmakeMinimal
      just
      jq
    ];
  };
}
