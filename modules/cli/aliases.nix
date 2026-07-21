{
  flake.aspects.cli-aliases = {
    homeManager = {
      home.shellAliases = {
        md = "mkdir -p";
        la = "ls -a";
        lsa = "ls -a";
        ll = "ls -lah";
        l = "ls -lh";
      };
    };
  };
}
