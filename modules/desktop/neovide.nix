{lib, ...}: {
  flake.modules.nixos.neovide = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      neovide
    ];
  };

  flake.modules.homeManager.neovide = {pkgs, ...}: {
    programs.neovide = {
      enable = true;

      settings = lib.mkMerge [
        {
          fonts = let
            family = "Lilex Nerd Font";
          in {
            # TODO: get font size on per-system basis
            size = 10;
            normal = {
              inherit family;
              style = "Regular";
            };
            bold = {
              inherit family;
              style = "Bold";
            };
            italic = {
              inherit family;
              style = "Medium Italic";
            };
            bold_italic = {
              inherit family;
              style = "Bold Italic";
            };
          };
        }
        (lib.mkIf pkgs.stdenv.isDarwin {
          frame = "buttonless";
          title-hidden = true;
          srgb = true;
        })
      ];
    };
    home.shellAliases = {
      vv = "neovide";
    };
  };
}
