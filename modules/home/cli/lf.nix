{
  config,
  lib,
  pkgs,
  flake,
  ...
}:
let
  cfg = config.atoms.cli.lf;
  bat-cmd = "${lib.getExe pkgs.bat} --paging=never --color=always --style=plain %pistol-filename%";
in
{
  options.atoms.cli.lf = {
    enable = lib.mkEnableOption "lf, the tui file manager";
  };

  config = lib.mkIf (config.atoms.cli.enable && cfg.enable) {
    programs.pistol = {
      enable = true;
      associations = [
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

    # TODO: wrap deps with lf
    home.packages = with pkgs; [
      trashy
      vimv-rs
      chafa
    ];

    programs.lf.enable = true;
    # TODO: mb define in options or globally? or make wrapper
    xdg.configFile.lf.source = flake + /config/lf;
    programs.fish.functions.lf = ''
      cd (command lf -print-last-dir $argv)
    '';
  };
}
