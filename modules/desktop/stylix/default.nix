{inputs, ...}: {
  flake.modules.nixos.desktop-stylix = {
    imports = [inputs.stylix.nixosModules.stylix];
    stylix.enable = true;
    stylix.targets = {
      noctalia-shell.enable = false;
      neovim.enable = false;
    };
  };
}
