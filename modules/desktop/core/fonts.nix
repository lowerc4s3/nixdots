{
  flake.aspects.nixos = {
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
