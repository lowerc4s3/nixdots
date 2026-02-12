let
  shared = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
in {
  flake.modules.nixos.zoxide = shared;
  flake.modules.homeManager.zoxide = shared;
}
