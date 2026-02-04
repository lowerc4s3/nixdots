{self, ...}: {
  flake.modules.nixos.base-develop = {
    imports = with self.modules.nixos; [
      neovide
    ];
  };

  flake.modules.homeManager.base-develop = {
    imports = with self.modules.homeManager; [
      neovide
    ];
  };
}
