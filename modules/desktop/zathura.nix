{
  flake.modules.nixos.zathura = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (zathura.override {
        plugins = with pkgs.zathuraPkgs; [
          zathura_pdf_mupdf
        ];
      })
    ];
  };

  flake.modules.homeManager.zathura = {pkgs, ...}: {
    programs.zathura = {
      enable = true;
      package = pkgs.zathura.override {
        plugins = with pkgs.zathuraPkgs; [
          zathura_pdf_mupdf
        ];
      };
      options = {
        adjust-open = "best-fit";
        font = "JetBrains Mono 12";
        statusbar-page-percent = true;
        selection-clipboard = "clipboard";
        window-title-basename = true;
        # TODO: scroll step dependant on system (darwin/nixos)
      };
    };
  };
}
