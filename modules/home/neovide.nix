{ osConfig, lib, ... }:
let
  subpixelEnabled = osConfig.fonts.fontconfig.subpixel.rgba != "none";
in
{
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      font = {
        hinting = "slight";
        edging = lib.mkIf subpixelEnabled "subpixelantialias";
      };
    };
  };

  programs.fish.shellAbbrs = {
    vv = "neovide";
  };
}
