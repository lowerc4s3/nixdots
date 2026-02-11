{
  flake.modules.nixos.appimage = {
    programs.appimage = {
      enable = true;

      # automatically run appimages through appimage-run
      binfmt = true;
    };
  };
}
