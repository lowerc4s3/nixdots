{self, ...}: {
  flake.nixosConfigurations = self.lib.mkNixosWithUser "lithium" "lowerc4s3" {
    includes = with self.aspects; [
      base-desktop

      sys-amd
      sys-nvidia
      sys-ntfs
      sys-ssd
      sys-cuda

      cli-nushell

      desktop-niri-with-noctalia
      desktop-flatpak

      apps-social
      apps-virtualbox
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

    module = {
      lib,
      pkgs,
      ...
    }: {
      time.timeZone = "Europe/Moscow";
      system.stateVersion = "25.11";

      users.users.lowerc4s3.shell = pkgs.bashInteractive;
      programs.bash.interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "nu" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${lib.getExe pkgs.nushell} $LOGIN_OPTION
        fi
      '';

      imports = [./hardware-configuration.nix];
      home-manager.users.lowerc4s3 = {
        home.stateVersion = "25.11";
      };
    };
  };
}
