{
  flake.modules.nixos.bat = {
    programs.bat.enable = true;
  };

  flake.modules.homeManager.bat = {
    programs.bat = {
      enable = true;
      config = {
        style = "numbers";
        set-terminal-title = true;
      };
    };
  };
}
