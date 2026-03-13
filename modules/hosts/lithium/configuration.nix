{self, ...}: {
  flake.nixosConfigurations = self.lib.mkNixosWithUser "lithium" "lowerc4s3" {
    includes = with self.aspects; [
      base-desktop

      sys-amd
      sys-nvidia
      sys-ntfs
      sys-ssd

      desktop-niri-with-noctalia

      apps-social

      games-core
      games-steam
      games-minecraft

      dev-core
      dev-neovide
    ];

    module = {
      time.timeZone = "Europe/Moscow";
      system.stateVersion = "25.11";

      imports = [./hardware-configuration.nix];
      home-manager.users.lowerc4s3 = {
        home.stateVersion = "25.11";
      };
    };
  };
}
