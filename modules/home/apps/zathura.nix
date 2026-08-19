{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.zathura;
in
{
  options.atoms.apps.zathura = {
    enable = lib.mkEnableOption "vicinae launcher";
  };

  config = lib.mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      package = pkgs.zathura.override {
        plugins = [ pkgs.zathuraPkgs.zathura_pdf_mupdf ];
      };
      options = {
        adjust-open = "best-fit";
        statusbar-page-percent = true;
        selection-clipboard = "clipboard";
        window-title-basename = true;
      };
    };
  };
}
