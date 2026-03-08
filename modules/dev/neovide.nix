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
