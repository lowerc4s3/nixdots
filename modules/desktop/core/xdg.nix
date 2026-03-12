{
  flake.aspects.desktop-core.homeManager = {
    xdg = {
      enable = true;
      mimeApps.enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
