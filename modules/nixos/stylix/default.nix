{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = import ./colors/oxocarbon.nix;
    polarity = "dark";

    fonts = {
      sansSerif = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.lilex;
        name = "Lilex Nerd Font";
      };
      sizes.terminal = 10;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.morewaita-icon-theme;
      light = "MoreWaita";
      dark = "MoreWaita";
    };
  };
}
