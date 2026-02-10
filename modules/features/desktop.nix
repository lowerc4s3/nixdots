{self, ...}: {
  flake.modules.nixos.base-desktop = {
    imports = with self.modules.nixos; [
      base-minimal

      audio
      fonts
      appimage
      librewolf
      # keeping this until i fix dns resolution
      # clash-verge
      v2raya
      telegram
    ];
  };

  flake.modules.homeManager.base-desktop = {
    imports = with self.modules.homeManager; [
      base-minimal

      librewolf
    ];
  };
}
