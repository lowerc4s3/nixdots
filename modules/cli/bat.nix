{
  flake.modules.homeManager.cli-bat = {
    programs.bat = {
      enable = true;
      config = {
        style = "numbers";
        set-terminal-title = true;
      };
    };
  };
}
