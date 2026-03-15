{
  flake.aspects.cli-eza = {
    homeManager = {
      programs.eza = {
        enable = true;
        icons = "auto";
        colors = "auto";
        extraOptions = [
          "--group-directories-first"
        ];
      };
      home.shellAliases = {
        ls = "eza";
        tree = "eza --tree";
      };
    };
  };
}
