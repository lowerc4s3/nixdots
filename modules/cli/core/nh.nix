{
  flake.modules.nixos.cli-core = {
    programs.nh.enable = true;
  };

  flake.modules.darwin.cli-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nh
    ];
  };

  flake.modules.homeManager.cli-core = {config, ...}: {
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
