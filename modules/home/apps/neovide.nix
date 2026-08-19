{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.apps.neovide;
in
{
  options.atoms.apps.neovide = {
    enable = lib.mkEnableOption "neovide";
  };

  config = lib.mkIf cfg.enable {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
        font.hinting = "slight";
      };
    };

    atoms.cli.shell.abbrs.vv = "neovide";
  };
}
