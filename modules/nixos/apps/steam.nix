{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.steam;
in
{
  options.atoms.apps.steam = {
    enable = lib.mkEnableOption "steam game platform";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
