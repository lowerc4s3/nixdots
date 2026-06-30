{
  flake.aspects.games-core = {
    nixos = {pkgs, ...}: {
      programs.gamescope = {
        enable = true;
        capSysNice = false;
      };

      services.ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-cpp;
        extraRules = [
          {
            "name" = "gamescope";
            "nice" = -20;
          }
        ];
      };
    };
  };
}
