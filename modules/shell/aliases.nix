{lib, ...}: {
  flake.modules.homeManager.aliases = {
    home.shellAliases = {
      md = "mkdir -p";
      la = lib.mkDefault "ls -a";
      lsa = lib.mkDefault "ls -a";
      ll = lib.mkDefault "ls -lah";
      l = lib.mkDefault "ls -lh";

      # enable colored `grep` output
      grep = "grep --color=auto";
    };
  };
}
