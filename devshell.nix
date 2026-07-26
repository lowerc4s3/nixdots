{pkgs, ...}: pkgs.mkShell {
  packages = with pkgs; [
    nixd
    alejandra
  ];
}
