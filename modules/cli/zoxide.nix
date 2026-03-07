{
  flake.modules.homeManager.cli-zoxide = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
