{ pkgs, ... }: {
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
}
