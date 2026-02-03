let
  shared = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
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
        monospace = ["JetBrains Mono"];
        # TODO: serif and sans
      };
    };
  };
}
