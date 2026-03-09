{self, ...}: {
  flake.nixosConfigurations = self.lib.mkNixosWithUser "lithium" "lowerc4s3" {
    time.timeZone = "Europe/Moscow";
    system.stateVersion = "25.11";

    imports = with self.modules.nixos; [
      ./hardware-configuration.nix
      base-desktop

      sys-amd
      sys-nvidia
      sys-ntfs
      sys-ssd

      desktop-niri

      apps-social
      games-core
      dev-core
      dev-neovide
    ];

    home-manager.users.lowerc4s3 = {
      home.stateVersion = "25.11";
      imports = with self.modules.homeManager; [
        base-desktop

        desktop-niri

        apps-social
        games-core
        dev-neovide
      ];
    };
  };
}
