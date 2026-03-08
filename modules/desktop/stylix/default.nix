{inputs, ...}: {
  flake.modules.nixos.desktop-stylix = {lib, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];
    stylix.enable = true;

    stylix.targets = {
      plymouth.enable = false;
      grub.enable = false;
      qt.enable = false;
      qt.platform = lib.mkForce "qtct";
    };
  };

  flake.modules.homeManager.desktop-stylix = {
    stylix.targets = {
      librewolf = {
        firefoxGnomeTheme.enable = true;
        profileNames = ["default"];
      };
    };
  };
}
