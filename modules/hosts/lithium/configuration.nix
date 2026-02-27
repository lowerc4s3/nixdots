{
  inputs,
  self,
  lib,
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
      profile-desktop
      profile-gaming
      self.modules.nixos.${hostuser}

      nvidia
      amd
      ssd
      ntfs
      kde

      neovide
      zathura
      discord
    ];

    time.timeZone = "Europe/Moscow";
    system.stateVersion = "25.11";
  };

  flake.modules.nixos.${hostuser} = {
    config,
    pkgs,
    ...
  }: {
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        (lib.mkIf config.networking.networkmanager.enable "networkmanager")
        (lib.mkIf config.programs.gamemode.enable "gamemode")
      ];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = {
      imports = with self.modules.homeManager; [
        profile-desktop
        neovide
        zathura
      ];
      home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
    };
  };
}
