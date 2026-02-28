{
  flake.modules.nixos.clash-verge = {config, ...}: {
    programs.clash-verge = {
      enable = true;
      autoStart = true;
      serviceMode = false;
      tunMode = true;
    };

    # NOTE: using own clash verge service to allow process name routing
    # (see https://github.com/MetaCubeX/mihomo/issues/961)
    systemd.services.clash-verge = let 
      caps = ["CAP_NET_ADMIN CAP_NET_RAW CAP_SYS_ADMIN CAP_DAC_OVERRIDE CAP_SETUID CAP_SETGID CAP_CHOWN CAP_MKNOD CAP_SYS_PTRACE CAP_DAC_READ_SEARCH"];
    in {
      enable = true;
      description = "Clash Verge Service";
      serviceConfig = {
        ExecStart = "${config.programs.clash-verge.package}/bin/clash-verge-service";
        Restart = "on-failure";
        ProtectSystem = "strict";
        NoNewPrivileges = true;
        ProtectHostname = true;
        SystemCallArchitectures = "native";
        PrivateTmp = true;
        PrivateMounts = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RuntimeDirectory = "clash-verge-rev";
        ProtectClock = true;
        MemoryDenyWriteExecute = true;
        RestrictSUIDSGID = true;
        RestrictNamespaces = ["~user cgroup mnt uts"];
        RestrictAddressFamilies = [
          "AF_INET AF_INET6 AF_NETLINK AF_PACKET AF_UNIX"
        ];
        CapabilityBoundingSet = caps;
        AmbientCapabilities = caps;
        SystemCallFilter = [
          "~@aio @chown @clock @cpu-emulation @debug @keyring @memlock @module @mount @obsolete @pkey @privileged @raw-io @reboot @sandbox @setuid @swap @timer"
        ];
        SystemCallErrorNumber = "EPERM";
      };
      wantedBy = ["multi-user.target"];
    };
    networking.firewall.trustedInterfaces = ["Mihomo"];
  };
}
