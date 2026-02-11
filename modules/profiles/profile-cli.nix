{self, ...}: {
  flake.modules.nixos.profile-cli = {
    imports = with self.modules.nixos; [
      profile-base
      home-manager
      zsh
      git
      nh
      yazi
      neovim
    ];
  };

  flake.modules.darwin.profile-cli = {
    imports = with self.modules.darwin; [
      profile-base
      nh
    ];
  };

  flake.modules.homeManager.profile-cli = {
    imports = with self.modules.homeManager; [
      profile-base
      xdg
      zsh
      git
      nh
      yazi
      neovim
    ];
  };
}
