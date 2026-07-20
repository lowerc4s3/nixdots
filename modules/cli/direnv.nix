{
  flake.aspects.cli-direnv = {
    nixos = {
      programs.direnv = {
        enable = true;
        settings.global = {
          load_dotenv = true;
          strict_env = true;
          warn_timeout = "0s";
          hide_env_diff = true;
        };
      };
    };
  };
}
