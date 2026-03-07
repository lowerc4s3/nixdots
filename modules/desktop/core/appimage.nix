{
  flake.modules.nixos.desktop-core = {
    programs.appimage = {
      enable = true;

      # automatically run appimages through appimage-run
      binfmt = true;
    };
  };
}
