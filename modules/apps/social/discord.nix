{inputs, ...}: {
  flake.aspects.apps-social = {
    homeManager = {pkgs, ...}: {
      programs.discord = {
        enable = true;
        package = pkgs.discord.override {
          withVencord = true;
          withOpenASAR = true;
        };
      };
    };
  };
}
