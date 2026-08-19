{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.cli;
in
{
  imports = [
    ./shell
    ./bat.nix
    ./eza.nix
    ./git.nix
    ./lf.nix
  ];

  options.atoms.cli = {
    enable = lib.mkEnableOption "basic cli tools";
  };

  config = lib.mkIf cfg.enable {
    xdg.enable = true;

    programs = {
      nh = {
        enable = true;
        flake = lib.mkDefault "${config.home.homeDirectory}/nix";
      };

      fd = {
        enable = true;
        ignores = [
          ".git/"
          ".direnv/"
        ];
      };

      btop = {
        enable = true;
        settings = {
          vim_keys = true;
          rounded_corners = false;
          proc_tree = true;
        };
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
        config.global = {
          load_dotenv = true;
          strict_env = true;
          warn_timeout = "0s";
          hide_env_diff = true;
        };
      };

      tealdeer = {
        enable = true;
        enableAutoUpdates = false;
      };

      fzf.enable = true;
      zoxide.enable = true;
    };
  };
}
