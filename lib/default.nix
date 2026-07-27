{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
in
{
  mkCmd = lib.splitString " ";
}
