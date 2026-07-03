{
  flake.aspects.cli-lf = {
    homeManager = {pkgs, lib, ...}: {
      home.packages = with pkgs; [
        trashy
        vimv-rs
        chafa
      ];

      programs.pistol = {
        enable = true;
        associations = let
          bat-cmd =  "${lib.getExe pkgs.bat} --paging=never --color=always --style=plain %pistol-filename%";
        in [
          {
            command = bat-cmd;
            mime = "text/*";
          }
          {
            command = bat-cmd;
            mime = "application/json";
          }
        ];
      };

      programs.lf.enable = true;
      xdg.configFile.lf = {
        source = ./config;
      };
      programs.zsh.siteFunctions = {
        lf = ''cd "$(command lf -print-last-dir "$@")"'';
      };
    };
  };
}
