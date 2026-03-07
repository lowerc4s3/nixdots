{inputs, ...}: {
  flake.modules.nixos.cli-neovim = {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  flake.modules.homeManager.cli-neovim = {pkgs, ...}: {
    home = {
      packages = [inputs.nvx.packages.${pkgs.stdenv.system}.nvx];
      sessionVariables.EDITOR = "nvim";
      shellAliases = {
        v = "nvim";
      };
    };
  };
}
