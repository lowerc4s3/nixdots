{
  flake.aspects.apps-core = {
    nixos = {
      programs.foot = {
        enable = true;
      };
    };

    homeManager = {
      programs.foot = {
        enable = true;
        server.enable = false;
        settings = {
          main = {
            line-height = 18;
            pad = "5x5 center";
          };

          mouse.hide-when-typing = true;
        };
      };
    };
  };
}
