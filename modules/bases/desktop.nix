{inputs, ...}: {
  flake.modules.nixos.base-desktop = {
    imports = with inputs.self.modules.nixos; [
      minimal

      audio
      fonts
      appimage
    ];
  };
}
