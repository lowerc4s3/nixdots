{
  flake.modules.nixos.wallpaper = {
    lib,
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      # NOTE: at some point the rebranded version (awww)
      # will be upstreamed into nixpkgs
      waypaper
      swww
    ];

    systemd.user.services.waypaper-restore = {
      enable = true;
      path = with pkgs; [
        procps
        swww
      ];
      partOf = ["graphical-session.target"];
      after = ["graphical-session.target"];
      requisite = ["graphical-session.target"];
      wantedBy = ["niri.service"];
      description = "Waypaper restore service";
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${lib.getExe pkgs.waypaper} --restore";
      };
    };
  };

  flake.modules.homeManager.wallpaper = {
    pkgs,
    lib,
    ...
  }: {
    xdg.desktopEntries.waypaper = {
      name = "Waypaper";
      icon = ./waypaper.svg;
      genericName = "Waypaper wallpaper setter";
      comment = "Change wallpaper on Wayland and X11";
      categories = ["Utility" "Graphics"];
      exec = lib.getExe pkgs.waypaper;
    };
  };
}
