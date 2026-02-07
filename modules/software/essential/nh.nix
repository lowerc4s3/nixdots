{
  flake.modules.nixos.nh = {
    programs.nh.enable = true;
  };

  flake.modules.darwin.nh = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nh
    ];
  };

  flake.modules.homeManager.nh = {
    config,
    pkgs,
    ...
  }: {
    programs.nh = {
      enable = true;
      flake = "${config.home.homeDirectory}/nix";
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 14d";
      };
    };
  };
}
