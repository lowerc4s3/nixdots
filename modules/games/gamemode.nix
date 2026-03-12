{
  flake.aspects.games-gamemode = {
    nixos = {
      programs.gamemode = {
        enable = true;
        settings = {
          # increase process priority (renice to -10)
          general.renice = 10;
        };
      };
    };
  };
}
