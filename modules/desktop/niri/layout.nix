{
  flake.aspects.desktop-niri = {
    nixos = {
      pkgs,
      lib,
      ...
    }: let
      pkg = pkgs.callPackage ./_oniri.nix {};
    in {
      systemd.user.services.oniri = {
        wantedBy = ["niri.service"];
        after = ["niri.service"];
        description = "Automatically maximize the only window of a niri workspace";
        serviceConfig = {
          Type = "simple";
          ExecStart = "${lib.getExe pkg} --tiling-layout";
          Restart = "on-failure";
          RestartSec = "1s";
        };
      };
    };

    homeManager = {
      programs.niri.settings.layout = {
        empty-workspace-above-first = true;
        always-center-single-column = true;
        default-column-width.proportion = 1. / 2.;
        preset-column-widths = [
          {proportion = 1. / 3.;}
          {proportion = 1. / 2.;}
          {proportion = 2. / 3.;}
        ];

        tab-indicator = {
          hide-when-single-tab = true;
          place-within-column = true;
          length.total-proportion = 0.98;
          gap = 10;
          width = 5;
          gaps-between-tabs = 5;
          corner-radius = 10;
        };

        focus-ring.width = 1;

        gaps = 10;
        struts = {
          left = 25;
          right = 25;
          top = 15;
          bottom = 15;
        };
      };
    };
  };
}
