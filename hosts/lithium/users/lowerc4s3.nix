{
  flake,
  pkgs,
  perSystem,
  ...
}:
{
  home.stateVersion = "25.11";
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
    neovide
    zathura
    qutebrowser
    librewolf
  ];

  programs.niri.settings.outputs."DP-1" = {
    mode = {
      width = 1920;
      height = 1080;
      refresh = 144.0;
    };
    variable-refresh-rate = "on-demand";
  };

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

    perSystem.self.chainner
    identity
    (prismlauncher.override {
      jdks = with pkgs; [
        jdk17
      ];
    })

    loupe
    cine
  ];
}
