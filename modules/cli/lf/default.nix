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
        associations = [
          {
            # command = "${lib.getBin pkgs.bat} --paging=never --color=always --style=plain %pistol-filename%";
            command = "bat --paging=never --color=always --style=plain %pistol-filename%";
            mime = "text/*";
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
