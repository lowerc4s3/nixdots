{inputs, ...}: {
  flake.aspects.cli-neovim = {
    nixos = {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
      };
    };

    homeManager = {pkgs, ...}: {
      home = {
        packages = [inputs.nvx.packages.${pkgs.stdenv.system}.nvx];
        sessionVariables.EDITOR = "nvim";
        shellAliases = {
          v = "nvim";
        };
      };
    };
  };
}
