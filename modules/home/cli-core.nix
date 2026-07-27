{ config, lib, ... }:
{
  programs.fish.shellAbbrs = {
    md = "mkdir -p";
    la = "ls -a";
    lsa = "ls -a";
    ll = "ls -lah";
    l = "ls -lh";
    v = "nvim";
  };

  programs.fd = {
    enable = true;
    ignores = [ ".git/" ];
  };

  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/nix";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config.global = {
      load_dotenv = true;
      strict_env = true;
      warn_timeout = "0s";
      hide_env_diff = true;
    };
  };

  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = false;
  };

  programs.fzf = {
    enable = true;

    # NOTE: initializing fzf manually through zsh-vi-mode
    enableZshIntegration = false;
  };

  # NOTE: zvm must be loaded before fzf
  programs.zsh.initContent = lib.mkOrder 810 ''
    if [[ $options[zle] = on ]]; then
      zvm_after_init_commands+=('source <(${lib.getExe config.programs.fzf.package} --zsh)')
    fi
  '';

  programs.zoxide.enable = true;
}
