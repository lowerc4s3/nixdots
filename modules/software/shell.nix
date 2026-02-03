{
  flake.modules.general.shell = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
