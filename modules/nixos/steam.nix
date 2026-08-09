{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.millenium.overlays.default ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  services.ananicy =
    let
      pkg = pkgs.ananicy-cpp;
    in
    {
      enable = true;
      package = pkg;
      rulesProvider = pkg;
      extraRules = [
        {
          name = "gamescope";
          nice = -20;
        }
      ];
    };
}
