let
  shared = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      lilex
      nerd-fonts.lilex

      jetbrains-mono
      nerd-fonts.jetbrains-mono

      adwaita-fonts
    ];
  };
in {
  flake.modules.darwin.fonts = {
    imports = [
      shared
    ];
  };

  flake.modules.nixos.fonts = {
    imports = [
      shared
    ];

    fonts.fontconfig = {
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };

      defaultFonts = {
        monospace = ["Lilex Nerd Font"];
        sansSerif = ["Adwaita Sans"];
      };
    };
  };
}
