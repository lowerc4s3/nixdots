{self, ...}: {
  flake.modules.nixos.base-desktop = {
    imports = with self.modules.nixos; [
      base-minimal

      audio
      fonts
      appimage
    ];
  };
}
