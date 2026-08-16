{
  pkgs,
  flake,
  hostName,
  ...
}:
{
  system.stateVersion = "25.11";
  networking = { inherit hostName; };
  time.timeZone = "Europe/Moscow";

  imports = with flake.nixosModules; [
    sys-core
    printing

    cli-core
    nix
    fish

    desk-core
    stylix
    niri-noctalia
    sddm
    steam
    clash-verge
  ];

  #
  # boot
  #

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
      ];
    };
  };

  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_zen;
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub =
      let
        theme = pkgs.minimal-grub-theme;
      in
      {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        # select last booted entry by default
        default = "saved";
        configurationLimit = 50;

        inherit theme;
        splashImage = "${theme}/background.png";
      };
    timeout = 20;
  };

  #
  # drivers
  #

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    branch = "latest";

    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;

    # Enable nvidia-suspend/hibernate/resume services
    # and set NVreg_PreserveVideoMemoryAllocations
    powerManagement.enable = true;
  };

  #
  # users
  #

  users.users.lowerc4s3 = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs = {
    obs-studio.enable = true;
    gnome-disks.enable = true;

    localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
