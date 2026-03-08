{
  flake.modules.nixos.desktop-stylix = {pkgs, ...}: let
    getScheme = name: "${pkgs.base16-schemes}/share/themes/${name}.yaml";
    favorites = {
      tokyodark = getScheme "tokyodark";
      horizon-dark = getScheme "horizon-dark";
      flexoki-dark = getScheme "flexoki-dark";
      oxocarbon-terminal = {
        scheme = "Oxocarbon Dark Terminal";
        author = "shaunsingh/IBM";
        base00 = "#161616"; # regular
        base01 = "#262626";
        base02 = "#393939";
        base03 = "#525252";
        base04 = "#dde1e6";
        base05 = "#f2f4f8";
        base06 = "#ffffff";
        base07 = "#ffffff";
        base08 = "#ee5396"; # red
        base09 = "#78a9ff";
        base0A = "#ffe97b"; # yellow
        base0B = "#42be65"; # green
        base0C = "#08bdba"; # cyan
        base0D = "#33b1ff"; # blue
        base0E = "#be95ff"; # magenta
        base0F = "#82cfff";
        base10 = "#080808";
        base11 = "#000000";
        base12 = "#ff7eb6";
        base13 = "#ffe97b";
        base14 = "#42be65";
        base15 = "#3ddbd9";
        base16 = "#78a9ff";
        base17 = "#be95ff";
      };
    };
  in {
    stylix = {
      base16Scheme = favorites.oxocarbon-terminal;
    };
  };
}
