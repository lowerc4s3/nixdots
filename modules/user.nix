{inputs, ...}: let
  username = "lowerc4s3";
in {
  flake.modules.nixos.${username} = {pkgs, ...}: {
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];
    users.users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };

    home-manager.users.${username} = {
      imports = [
        inputs.self.modules.homeManager.${username}
      ];
    };
  };

  flake.modules.homeManager.${username} = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      base-minimal
    ];
    home.stateVersion = "25.11";
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
