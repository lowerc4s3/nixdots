{
  inputs,
  self,
  ...
}: let
  username = "lowerc4s3";
in {
  flake.modules.nixos.${username} = {pkgs, ...}: {
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = {
      imports = [
        self.modules.homeManager.${username}
      ];
    };
  };

  flake.modules.homeManager.${username} = {pkgs, ...}: {
    imports = with self.modules.homeManager; [
      base-minimal
      base-develop
    ];
    home.stateVersion = "25.11";
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
