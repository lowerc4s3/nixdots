{
  flake.modules.nixos.foot = {
    programs.foot = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  flake.modules.homeManager.foot = {lib, ...}: let
    inherit (lib) concat mapAttrsToList join;
    mkFont = family: params:
      params
      |> mapAttrsToList (param: value: "${param}=${toString value}")
      |> concat [family]
      |> join ":";
  in {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        colors = let
          # TODO: move color definitions somewhere else
          oxocarbonDark = {
            foreground = "dde1e6";
            background = "161616";
            regular0 = "262626";
            regular1 = "ee5396";
            regular2 = "42be65";
            regular3 = "ffe87b";
            regular4 = "78a9ff";
            regular5 = "be95ff";
            regular6 = "08bdba";
            regular7 = "dde1e6";
            bright0 = "393939";
            bright1 = "ff7eb6";
            bright2 = "42be65";
            bright3 = "ffe87b";
            bright4 = "33b1ff";
            bright5 = "be95ff";
            bright6 = "3ddbd9";
            bright7 = "f2f4f8";
          };
        in
          oxocarbonDark;

        main = {
          font = mkFont "monospace" {size = 11;};
          line-height = 19;
          pad = "5x5 center";
        };

        mouse.hide-when-typing = true;
      };
    };
  };
}
