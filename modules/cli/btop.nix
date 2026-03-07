{
  flake.modules.homeManager.cli-btop = {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = false;
        proc_tree = true;
      };
    };
  };
}
