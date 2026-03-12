{inputs, ...}: {
  flake.lib.mkNixosWithUser = hostname: username: {
    includes,
    module,
  }: let
    aspectsModule = {inherit includes;};

    initModule = {
      pkgs,
      config,
      lib,
      ...
    }: let
      aspectsLib = inputs.flake-aspects.lib lib;
    in {
      networking.hostName = "${hostname}";
      imports = [
        (aspectsLib.resolve "nixos" [] aspectsModule)
        module
      ];

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
        imports = [(aspectsLib.resolve "homeManager" [] aspectsModule)];
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
