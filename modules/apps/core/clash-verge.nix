{
  flake.aspects.apps-core.nixos = {lib, ...}: {
    programs.clash-verge = {
      enable = true;
      autoStart = true;
      serviceMode = true;
      tunMode = true;
    };

    # NOTE: appending additional capabilities to clash verge service to allow
    # process name routing (see https://github.com/MetaCubeX/mihomo/issues/961)
    networking.firewall.trustedInterfaces = ["Mihomo"];
    systemd.services.clash-verge.serviceConfig = let
      caps = ["CAP_NET_ADMIN CAP_NET_RAW CAP_SYS_ADMIN CAP_DAC_OVERRIDE CAP_SETUID CAP_SETGID CAP_CHOWN CAP_MKNOD CAP_SYS_PTRACE CAP_DAC_READ_SEARCH"];
    in {
      CapabilityBoundingSet = lib.mkForce caps;
      AmbientCapabilities = lib.mkForce caps;
    };
  };
}
