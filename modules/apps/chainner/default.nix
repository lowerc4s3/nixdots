{
  flake.aspects.apps-chainner.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (callPackage ./_package.nix {})
      identity
    ];
  };
}
