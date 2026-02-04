{lib, ...}: {
  flake.modules.nixos.neovide = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      neovide
    ];
  };

  flake.modules.homeManager.neovide = {pkgs, ...}: {
    programs.neovide = {
      enable = true;

      settings.fonts = let
        family = "JetBrainsMono Nerd Font";
      in {
        size = 12;
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

      settings = lib.mkIf pkgs.stdenv.isDarwin {
        frame = "buttonless";
        title-hidden = true;
        srgb = true;
      };
    };
  };
}
