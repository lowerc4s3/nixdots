{lib, ...}: {
  flake.modules.nixos.neovim = {
    programs.neovim = {
      enable = true;
      viAlias = lib.mkDefault true;
      vimAlias = lib.mkDefault true;
    };
  };

  # TODO: nixvim or nvf
}
