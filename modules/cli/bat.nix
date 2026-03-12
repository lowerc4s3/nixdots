{
  flake.aspects.cli-bat = {
    homeManager = {
      programs.bat = {
        enable = true;
        config = {
          style = "numbers";
          set-terminal-title = true;
        };
      };
    };
  };
}
