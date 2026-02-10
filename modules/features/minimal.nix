{self, ...}: {
  flake.modules.nixos.base-minimal = {
    imports = with self.modules.nixos; [
      nixconf

      firmware
      locale
      network
      nix-ld

      home-manager
      zsh
      neovim
      git
      nh
      yazi
    ];
  };

  flake.modules.darwin.base-minimal = {
    imports = with self.modules.darwin; [
      nixconf
      network
      nh
    ];
  };

  flake.modules.homeManager.base-minimal = {
    imports = with self.modules.homeManager; [
      xdg
      zsh
      git
      neovim
      nh
      yazi
    ];
  };
}
