{
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
    };

  };

  programs.fish.shellAbbrs = {
    vv = "neovide";
  };
}
