{
  flake,
  pkgs,
  ...
}:
{
  imports = with flake.homeModules; [
    cli-core
    fish
    eza
    git
    lf
    btop
    bat

    desk-core
    stylix
    niri-noctalia
    zathura
    qutebrowser
  ];

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
  };

  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    telegram-desktop
    loupe
    cine
  ];
}
