{ pkgs, perSystem, ... }:
{
  home.stateVersion = "25.11";

  atoms = {
    cli = {
      enable = true;
      bat.enable = true;
      eza.enable = true;
      lf.enable = true;
      shell = {
        abbrs.v = "nvim";
        fish.enable = true;
      };
    };

    stylix.enable = true;

    desktop = {
      enable = true;
      niri = {
        enable = true;
        withNoctalia = true;
        displays."DP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 144.0;
          };
          variable-refresh-rate = "on-demand";
        };
        defaultApps = {
          browser = "qutebrowser";
          terminal = "footclient";
        };
      };
    };

    apps = {
      foot = {
        enable = true;
        server.enable = true;
      };
      librewolf.enable = true;
      qutebrowser.enable = true;
      neovide.enable = true;
      zathura.enable = true;
    };
  };

  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    telegram-desktop

    perSystem.self.chainner
    perSystem.nvx.nvx
    identity

    (prismlauncher.override { jdks = [ jdk17 ]; })

    loupe
    cine
  ];

  services.easyeffects.enable = true;

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
  };
}
