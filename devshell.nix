{ pkgs, perSystem, ... }:
pkgs.mkShell {
  packages =
    perSystem.self.formatter.passthru.runtimeInputs
    ++ (with pkgs; [
      nixd
    ]);
}
