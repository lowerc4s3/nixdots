{inputs, ...}: {
  flake.modules.nixos.desktop-stylix = {
    lib,
    pkgs,
    ...
  }: {
    imports = [inputs.stylix.nixosModules.stylix];
    stylix = {
      enable = true;

      targets = {
        plymouth.enable = false;
        grub.enable = false;
        qt.enable = false;
        qt.platform = lib.mkForce "qtct";
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
    };
  };

  flake.modules.homeManager.desktop-stylix = {
    stylix.targets = {
      nixcord.enable = false;
      librewolf = {
        firefoxGnomeTheme.enable = true;
        profileNames = ["default"];
      };
    };
  };
}
