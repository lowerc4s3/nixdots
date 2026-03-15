{
  flake.aspects = {aspects, ...}: {
    base-cli = {
      includes = with aspects; [
        base-minimal

        cli-bat
        cli-btop
        cli-fzf
        cli-neovim
        cli-starship
        cli-yazi
        cli-zoxide
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
  };
}
