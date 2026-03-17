{
  flake.aspects.desktop-nautilus = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nautilus
      ];

      # quick preview in nautilus
      services.gnome.sushi.enable = true;

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
