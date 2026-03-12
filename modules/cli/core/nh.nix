{
  flake.aspects.cli-core = {
    nixos = {
      programs.nh.enable = true;
    };

    darwin = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nh
      ];
    };

    homeManager = {config, ...}: {
      programs.nh = {
        enable = true;
        flake = "${config.home.homeDirectory}/nix";
        clean = {
          enable = true;
          extraArgs = "--keep 3 --keep-since 14d";
        };
      };
    };
  };
}
