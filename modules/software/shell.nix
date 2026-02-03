{
  flake.modules.nixos.shell = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
