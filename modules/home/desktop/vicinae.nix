{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.atoms.desktop.vicinae;
in
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  options.atoms.desktop.vicinae = {
    enable = lib.mkEnableOption "vicinae launcher";
  };

  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    programs.vicinae = {
      enable = true;
      systemd.enable = true;
      package = pkgs.vicinae;

      settings = {
        favorites = [ ];
        pop_to_root_on_close = true;

        launcher_window = {
          blur.enabled = false;
          client_side_decorations = {
            rounding = 10;
            border-width = 1;
          };
          compact_mode.enabled = false;
          layer_shell.layer = "overlay";
        };

        providers = {
          # app aliases
          applications.entrypoints = {
            librewolf.alias = "lw";
            neovide.alias = "nv";
            discord.alias = "ds";
            "org.telegram".alias = "tg"; # weird ass name
            "org.qutebrowser.qutebrowser".alias = "qb";
            "org.gnome.Nautilus".alias = "fs";
          };

          browser-extension.enabled = false;
          developer.enabled = false;
          font.enabled = false;
          manage-shortcuts.enabled = false;
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
