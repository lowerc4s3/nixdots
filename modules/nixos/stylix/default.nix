{
  lib,
  config,
  pkgs,
  inputs,
  flake,
  ...
}:
let
  cfg = config.atoms.stylix;
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  options.atoms.stylix = {
    enable = lib.mkEnableOption "colors and fonts management with stylix";
  };

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [ flake.homeModules.stylix ];
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

    environment.systemPackages = [ config.stylix.cursor.package ];
    services.displayManager.sddm.settings.Theme = {
      CursorTheme = config.stylix.cursor.name;
      CursorSize = config.stylix.cursor.size;
    };
  };
}
