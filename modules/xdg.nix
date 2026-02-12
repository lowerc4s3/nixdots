{
  flake.modules.homeManager.xdg = {
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
