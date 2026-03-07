{
  flake.modules.homeManager.desktop-core = {
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
