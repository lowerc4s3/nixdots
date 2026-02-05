{self, ...}: {
  flake.modules.nixos.base-desktop = {
    imports = with self.modules.nixos; [
      base-minimal

      audio
      fonts
      appimage
      librewolf
    ];
  };

  flake.modules.homeManager.base-desktop = {
    imports = with self.modules.homeManager; [
      base-minimal

      librewolf
    ];
  };
}
