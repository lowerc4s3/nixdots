{inputs, ...}: {
  flake.lib.mkNixosWithUser = hostname: username: {
    includes,
    module,
  }: let
    resolveIncludes = class: {imports = map (aspect: aspect.resolve {inherit class;}) includes;};

    initModule = {
      config,
      lib,
      ...
    }: {
      networking.hostName = "${hostname}";
      imports = [
        (resolveIncludes "nixos")
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
          (lib.mkIf config.virtualisation.virtualbox.host.enable "vboxusers")
        ];
      };

      home-manager.users.${username} = {
        imports = [(resolveIncludes "homeManager")];
        home = {
          inherit username;
          homeDirectory = "/home/${username}";
        };
      };
    };
  in {
    "${hostname}" = inputs.nixpkgs.lib.nixosSystem {
      modules = [initModule];
    };
  };
}
