{
  pkgs,
  lib,
  flake,
  ...
}: {
  home.packages = with pkgs; [
    trashy
    vimv-rs
    chafa
  ];

  programs.pistol = {
    enable = true;
    associations = let
      bat-cmd = "${lib.getExe pkgs.bat} --paging=never --color=always --style=plain %pistol-filename%";
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
    source = flake + /config/lf;
  };
  programs.zsh.siteFunctions = {
    lf = ''cd "$(command lf -print-last-dir "$@")"'';
  };
  programs.fish.functions = {
    lf = ''cd (command lf -print-last-dir $argv)'';
  };
}
