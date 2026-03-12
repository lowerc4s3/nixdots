{
  flake.aspects.cli-btop = {
    homeManager = {
      programs.btop = {
        enable = true;
        settings = {
          vim_keys = true;
          rounded_corners = false;
          proc_tree = true;
        };
      };
    };
  };
}
