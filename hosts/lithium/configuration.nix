{
  flake,
  hostName,
  pkgs,
  ...
}:
{
  system.stateVersion = "25.11";
  imports = [ flake.nixosModules.desktop ];
  networking = { inherit hostName; };
  time.timeZone = "Europe/Moscow";

  hardware.facter.reportPath = ./facter.json;
  swapDevices = [ { device = "/dev/disk/by-label/linuxswap"; } ];
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixroot";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
    "/mnt/Storage" = {
      device = "/dev/disk/by-label/Storage";
      fsType = "ntfs";
      options = [
        "defaults"
        "nosuid"
        "dmask=022"
        "fmask=133"
        "uid=1000"
        "gid=100"
        "windows_names"
        "nofail"
        "x-gvfs-show"
        "noauto"
        "x-systemd.automount"
      ];
    };
  };

  atoms = {
    system = {
      enable = true;
      dualboot.enable = true;
      graphics.nvidia.enable = true;
      network.enable = true;
      audio.enable = true;
      printing = {
        enable = true;
        drivers = [ pkgs.hplip ];
      };
      users.lowerc4s3 = {
        enable = true;
        isAdmin = true;
      };
    };

    cli = {
      enable = true;
      nix.enable = true;
    };

    stylix.enable = true;

    desktop = {
      enable = true;
      sddm.enable = true;
      niri = {
        enable = true;
        withNoctalia = true;
      };
    };

    apps = {
      iloader.enable = true;
      clash-verge.enable = true;
      steam = {
        enable = true;
        millenium.enable = true;
      };
    };
  };

  programs = {
    gnome-disks.enable = true;
    localsend = {
      enable = true;
      openFirewall = true;
    };

    gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };
  };
}
