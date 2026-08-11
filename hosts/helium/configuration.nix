{
  pkgs,
  flake,
  hostName,
  ...
}:
{
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
    clash-verge
  ];

  #
  # boot
  #

  boot.loader = {
    efi.canTouchEfiVariables = false;
    systemd-boot = {
      enable = true;
      configurationLimit = 30;
    };
    timeout = 5;
  };

  #
  # drivers
  #

  hardware.graphics.enable = true;

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

  fonts.fontconfig = {
    hinting.enable = false;
  };
}
