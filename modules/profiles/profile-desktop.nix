{self, ...}: {
  flake.modules.nixos.profile-desktop = {
    imports = with self.modules.nixos; [
      profile-cli
      grub
      plymouth
      audio
      fonts
      appimage
      librewolf
      telegram
      v2raya
      gvfs
    ];
  };

  flake.modules.darwin.profile-desktop = {
    imports = with self.modules.darwin; [
      profile-cli
    ];
  };

  flake.modules.homeManager.profile-desktop = {
    imports = with self.modules.homeManager; [
      profile-cli

      librewolf
    ];
  };
}
