{
  flake.aspects.cli-nushell = {
    homeManager = {
      programs.nushell = {
        shellAliases = {
          md = "mkdir";
          la = "ls -a";
          l = "ls";
          fg = "job unfreeze";
          o = "open";
        };

        extraConfig = ''
          def --env mkcd [dir: path] { mkdir $dir; cd $dir }
        '';
      };
    };
  };
}
