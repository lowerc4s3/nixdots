{self, ...}: {
  flake.modules.nixos.base-minimal = {
    imports = with self.modules.nixos; [
      nixconf

      firmware
      locale
      network
      nix-ld

      zsh
      neovim
      git
    ];
  };

  flake.modules.darwin.base-minimal = {
    imports = with self.modules.darwin; [
      nixconf
      network
    ];
  };

  flake.modules.homeManager.base-minimal = {
    imports = with self.modules.homeManager; [
      xdg
      zsh
    ];
  };
}
