{
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
      settings.user = {
        name = "lowerc4s3";
        email = "kkirill03@gmail.com";
      };
    };
  };
}
