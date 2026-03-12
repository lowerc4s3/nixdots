{
  flake.aspects.cli-zoxide = {
    homeManager = {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
