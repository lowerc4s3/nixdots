{ pkgs, ... }:
pkgs.nixfmt-tree.override {
  nixfmtPackage = pkgs.nixfmt-rs;
}
