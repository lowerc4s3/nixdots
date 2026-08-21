{ pkgs, perSystem, ... }:
pkgs.mkShellNoCC {
  packages =
    perSystem.self.formatter.passthru.runtimeInputs
    ++ (with pkgs; [
      nixd
    ]);
}
