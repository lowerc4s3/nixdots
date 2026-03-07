{
  flake.modules.homeManager.cli-fzf = {
    lib,
    config,
    ...
  }: {
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
  };
}
