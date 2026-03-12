{self, ...}: {
  flake.aspects.base-cli = {
    includes = with self.aspects; [
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

    nixos = {
      lib,
      pkgs,
      ...
    }: {
      # use stable kernel on more minimal installations
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    };
  };
}
