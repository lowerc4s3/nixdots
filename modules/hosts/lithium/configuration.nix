{
  inputs,
  self,
  ...
}: let
  hostname = "lithium";
  username = "lowerc4s3";
  hostuser = "${hostname}-${username}";
in {
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules; [
      nixos.${hostname}
    ];
  };

  flake.modules.nixos.${hostname} = {pkgs, ...}: {
    networking.hostName = "${hostname}";
    imports = with self.modules.nixos; [
      base-desktop
      base-develop
      self.modules.nixos.${hostuser}

      grub
      nvidia
      amd
      kde
    ];

    # enable periodic ssd trim
    services.fstrim.enable = true;

    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.supportedFilesystems = ["ntfs"];
    time.timeZone = "Europe/Moscow";

    system.stateVersion = "25.11";
  };

  flake.modules.nixos.${hostuser} = {pkgs, ...}: {
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = {
      imports = with self.modules.homeManager; [
        base-minimal
        base-develop
        base-desktop
      ];
      home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
    };
  };
}
