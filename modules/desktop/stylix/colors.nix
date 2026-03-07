{
  flake.modules.nixos.desktop-stylix = {pkgs, ...}: let
    getScheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
  in {
    stylix = {
      base16Scheme = getScheme "oxocarbon-dark";
    };
  };
}
