{inputs, ...}: {
  flake.modules.nixos.base-desktop = {
    imports = with inputs.self.modules.nixos; [
      base-minimal

      audio
      fonts
      appimage
    ];
  };
}
