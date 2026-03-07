{self, ...}: {
  flake.modules.nixos.base-cli = {
    pkgs,
    lib,
    ...
  }: {
    imports = with self.modules.nixos; [
      base-minimal
      cli-neovim
      cli-zsh
    ];

    # use stable kernel on more minimal installations
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
  };

  flake.modules.darwin.base-cli = {
    imports = with self.modules.darwin; [
      base-minimal
    ];
  };

  flake.modules.homeManager.base-cli = {
    imports = with self.modules.homeManager; [
      base-minimal
      cli-bat
      cli-btop
      cli-eza
      cli-fzf
      cli-neovim
      cli-starship
      cli-yazi
      cli-zoxide
      cli-zsh
    ];
  };
}
