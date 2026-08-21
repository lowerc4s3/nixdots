{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.cli.eza;
in
{
  options.atoms.cli.eza = {
    enable = lib.mkEnableOption "eza, the more featureful ls replacement";
  };

  config = lib.mkIf (config.atoms.cli.enable && cfg.enable) {
    atoms.cli.shell.aliases = {
      ls = "eza";
      tree = "eza --tree";
    };

    programs.eza = {
      enable = true;

      # disable creation of aliases
      enableFishIntegration = false;
      colors = "auto";
      extraOptions = [
        "--group-directories-first"
      ];
    };
  };
}
