{
  imports = [
    ./qt.nix
  ];

  xdg = {
    enable = true;
    mimeApps.enable = true;

    userDirs = {
      enable = true;
      setSessionVariables = false;
      createDirectories = true;
    };
  };
}
