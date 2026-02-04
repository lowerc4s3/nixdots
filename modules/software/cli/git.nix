{
  flake.modules.nixos.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
