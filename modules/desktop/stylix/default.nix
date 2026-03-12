{inputs, ...}: {
  flake.aspects.desktop-stylix.nixos = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    stylix = {
      enable = true;

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
  };
}
