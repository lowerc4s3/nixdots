{
  flake.aspects.desktop-stylix = {
    nixos = {pkgs, ...}: {
      stylix.fonts = {
        sansSerif = {
          package = pkgs.adwaita-fonts;
          name = "Adwaita Sans";
        };
        monospace = {
          package = pkgs.nerd-fonts.lilex;
          name = "Lilex Nerd Font";
        };

        sizes = {
          terminal = 10;
        };
      };
    };
  };
}
