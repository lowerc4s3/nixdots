{lib, ...}: {
  flake.modules.nixos.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };

  flake.modules.homeManager.git = {config, ...}: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      # TODO: settings.user.name and settings.user.email
    };
  };
}
