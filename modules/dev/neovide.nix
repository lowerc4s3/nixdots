{
  flake.modules.nixos.dev-neovide = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      neovide
    ];
  };

  flake.modules.homeManager.dev-neovide = {
    pkgs,
    lib,
    ...
  }: {
    programs.neovide = {
      enable = true;
      settings = lib.mkMerge [
        {
          fork = true;
          font = {
            # TODO: get font size on per-system basis
            size = 10;
            normal = "monospace";
          };
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
}
