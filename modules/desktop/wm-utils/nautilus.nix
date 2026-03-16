{
  flake.aspects.desktop-nautilus = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nautilus
      ];

      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "foot";
      };
    };

    homeManager = {
      xdg.mimeApps.defaultApplications = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
      };
    };
  };
}
