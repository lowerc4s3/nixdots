{
  flake.aspects.cli-eza = {
    homeManager = {
      programs.eza = {
        enable = true;

        # disable creation of aliases
        enableFishIntegration = false;
        colors = "auto";
        extraOptions = [
          "--group-directories-first"
        ];
      };
      programs.fish.shellAliases = {
        ls = "eza";
        tree = "eza --tree";
      };
    };
  };
}
