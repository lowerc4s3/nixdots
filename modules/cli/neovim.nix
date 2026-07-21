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
      home.sessionVariables.EDITOR = "nvim";
      programs.fish.shellAbbrs.v = "nvim";
    };
  };
}
