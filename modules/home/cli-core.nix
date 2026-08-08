{ config, lib, ... }:
{
  programs = {
    nh = {
      enable = true;
      flake = "${config.home.homeDirectory}/nix";
    };

    fish.shellAbbrs = {
      md = "mkdir -p";
      la = "ls -a";
      lsa = "ls -a";
      ll = "ls -lah";
      l = "ls -lh";
      v = "nvim";
    };

    fd = {
      enable = true;
      ignores = [ ".git/" ];
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

    fzf = {
      enable = true;

      # NOTE: initializing fzf manually through zsh-vi-mode
      enableZshIntegration = false;
    };

    zsh.initContent = lib.mkOrder 810 ''
      if [[ $options[zle] = on ]]; then
        zvm_after_init_commands+=('source <(${lib.getExe config.programs.fzf.package} --zsh)')
      fi
    '';

    zoxide.enable = true;
  };
}
