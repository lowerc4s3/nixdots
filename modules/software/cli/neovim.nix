{lib, ...}: {
  flake.modules.nixos.neovim = {
    viAlias = lib.mkDefault true;
    vimAlias = lib.mkDefault true;
  };

  # TODO: nixvim or nvf
}
