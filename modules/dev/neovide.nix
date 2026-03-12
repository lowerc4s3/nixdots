{
  flake.aspects.dev-neovide = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        neovide
      ];
    };

    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      programs.neovide = {
        enable = true;
        settings = lib.mkMerge [
          {
            fork = true;
          }
          (lib.mkIf pkgs.stdenv.isDarwin {
            frame = "buttonless";
            title-hidden = true;
            srgb = true;
          })
        ];
      };

      home.shellAliases = {
        vv = "neovide";
      };
    };
  };
}
