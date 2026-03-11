{
  flake.modules.nixos.desktop-stylix = {lib, ...}: {
    stylix.targets = {
      plymouth.enable = false;
      console.enable = false;
      grub.enable = false;
      qt = {
        enable = false;
        platform = lib.mkForce "qtct";
      };
    };
  };

  flake.modules.homeManager.desktop-stylix = {
    stylix.targets = {
      nixcord.enable = false;
      noctalia-shell.enable = false;
      librewolf = {
        firefoxGnomeTheme.enable = true;
        profileNames = ["default"];
      };
    };
  };
}
