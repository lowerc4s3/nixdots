{
  flake.modules.homeManager.desktop-vicinae = {
    programs.vicinae = {
      enable = true;
      systemd.enable = true;
      settings = {
        favorites = [];
        pop_to_root_on_close = true;

        font.normal.family = "system";
        launcher_window = {
          opacity = 1;
          blur.enabled = false;
          client_side_decorations = {
            rounding = 10;
            border-width = 1;
          };
          compact_mode.enabled = false;
        };

        providers = {
          # app aliases
          applications.entrypoints = {
            librewolf.alias = "lw";
            neovide.alias = "nv";
            discord.alias = "ds";
            "org.telegram".alias = "tg"; # weird ass name
          };

          browser-extension.enabled = false;
          core.enabled = false;
          developer.enabled = false;
          font.enabled = false;
          manage-shortcuts.enabled = false;
          theme.enabled = false;
          raycast-compat.enabled = false;

          calculator.entrypoints = {
            history.enabled = false;
            refresh-rates.enabled = false;
          };
          power.entrypoints = {
            hibernate.enabled = false;
            suspend.enabled = false;
            lock.enabled = false;
            soft-reboot.enabled = false;
          };
          clipboard.entrypoints = {
            clear.enabled = false;
            clear-history.enabled = false;
          };
          files.entrypoints = {
            rebuild-index.enabled = false;
          };
        };
      };
    };
  };
}
