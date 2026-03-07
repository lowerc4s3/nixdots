{
  flake.modules.nixos.desktop-stylix = {pkgs, ...}: {
    stylix.fonts = {
      packages = with pkgs; [
        jetbrains-mono
        nerd-fonts.jetbrains-mono
      ];

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
}
