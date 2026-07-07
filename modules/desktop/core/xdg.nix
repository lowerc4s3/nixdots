{
  flake.aspects.desktop-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        trashy
      ];
    };

    homeManager = {
      xdg = {
        enable = true;
        mimeApps.enable = true;

        userDirs = {
          enable = true;
          setSessionVariables = false;
          createDirectories = true;
        };
      };
    };
  };
}
