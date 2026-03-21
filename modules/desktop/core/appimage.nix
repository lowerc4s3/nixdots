{
  flake.aspects.desktop-core = {
    nixos = {
      programs.appimage = {
        enable = true;
        # automatically run appimages through appimage-run
        binfmt = true;
      };
    };
  };
}
