{
  flake.aspects.cli-neovim = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        tree-sitter
      ];
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
      };
    };

    homeManager = {
      home = {
        # packages = [inputs.nvx.packages.${pkgs.stdenv.system}.nvx];
        sessionVariables.EDITOR = "nvim";
        shellAliases = {
          v = "nvim";
        };
      };
    };
  };
}
