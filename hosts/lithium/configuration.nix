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
    ./hardware-configuration.nix
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

  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "amd_pstate=active" # use modern amd performance scaling driver
    ];
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

  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-uuid/AE62349D62346BE9";
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

  programs.obs-studio.enable = true;

  fonts.fontconfig = {
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel.rgba = "rgb";
  };
}
