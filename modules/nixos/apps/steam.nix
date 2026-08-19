{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.steam;
  inherit (lib) mkIf mkMerge;
in
{
  options.atoms.apps.steam = {
    enable = lib.mkEnableOption "steam game platform";
    millenium.enable = lib.mkEnableOption "millenium, the steam modding framework";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      programs.gamescope = {
        enable = true;
        capSysNice = false;
      };

      # gamescope won't launch without ananicy
      services.ananicy =
        let
          pkg = pkgs.ananicy-cpp;
        in
        {
          enable = true;
          package = pkg;
          rulesProvider = pkg;
          extraRules = lib.singleton {
            name = "gamescope";
            nice = -20;
          };
        };
    }

    (mkIf cfg.millenium.enable {
      nixpkgs.overlays = [ inputs.millenium.overlays.default ];
      programs.steam.package = pkgs.millennium-steam;
    })
  ]);
}
