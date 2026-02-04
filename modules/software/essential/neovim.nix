{lib, ...}: {
  flake.modules.nixos.neovim = {
    programs.neovim = {
      enable = true;
      viAlias = lib.mkDefault true;
      vimAlias = lib.mkDefault true;
    };
  };

  flake.modules.homeManager.neovim = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  # TODO: nixvim or nvf
}
