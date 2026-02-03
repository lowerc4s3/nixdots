{self, ...}: let
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
        self.flake.modules.homeManager.${username}
      ];
    };
  };

  flake.modules.homeManager.${username} = {pkgs, ...}: {
    imports = with self.flake.modules.homeManager; [
      base-minimal
    ];
    home.stateVersion = "25.11";
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
