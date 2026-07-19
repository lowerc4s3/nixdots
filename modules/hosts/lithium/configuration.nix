{self, ...}: {
  flake.nixosConfigurations = self.lib.mkNixosWithUser "lithium" "lowerc4s3" {
    includes = with self.aspects; [
      base-desktop

      sys-amd
      sys-nvidia
      sys-ntfs
      sys-ssd

      cli-fish

      desktop-niri-with-noctalia
      desktop-flatpak

      apps-social
      apps-onlyoffice
      apps-gnome-disks
      apps-chainner
      apps-loupe
      apps-clapper
      apps-obs

      games-core
      games-steam
      games-minecraft

      dev-core
      dev-neovide
    ];

    module = {pkgs, ...}: {
      time.timeZone = "Europe/Moscow";
      system.stateVersion = "25.11";

      users.users.lowerc4s3.shell = pkgs.fish;

      imports = [./hardware-configuration.nix];
      home-manager.users.lowerc4s3 = {
        home.stateVersion = "25.11";
      };
    };
  };
}
