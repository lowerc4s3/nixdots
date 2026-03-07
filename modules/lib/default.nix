{inputs, ...}: {
  flake.lib.mkNixosWithUser = hostname: username: module: let
    initModule = {
      pkgs,
      config,
      lib,
      ...
    }: {
      networking.hostName = "${hostname}";
      imports = [module];

      users.users.${username} = {
        isNormalUser = true;
        extraGroups = [
          # TODO: move group declarations into modules defining these
          # features (need to introduce a global config first to pass
          # through username and other settings)
          "wheel"
          (lib.mkIf config.networking.networkmanager.enable "networkmanager")
          (lib.mkIf config.programs.gamemode.enable "gamemode")
        ];
        shell = pkgs.zsh;
      };

      home-manager.users.${username}.home = {
        inherit username;
        homeDirectory = "/home/${username}";
      };
    };
  in {
    "${hostname}" = inputs.nixpkgs.lib.nixosSystem {
      modules = [initModule];
    };
  };
}
