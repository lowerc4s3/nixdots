{
  flake.aspects.games-steam = {
    nixos = {
      programs.steam = {
        gamescopeSession.enable = true;
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };
  };
}
