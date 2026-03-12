{inputs, ...}: {
  flake.aspects.home-manager = {
    nixos = {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "hmbak";
        overwriteBackup = true;
        verbose = true;
      };
    };
  };
}
