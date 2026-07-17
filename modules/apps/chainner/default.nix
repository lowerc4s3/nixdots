{
  flake.aspects.apps-chainner.nixos = {pkgs, ...}: {
    environment.systemPackages = [
      (pkgs.callPackage ./_package.nix {})
    ];
  };
}
