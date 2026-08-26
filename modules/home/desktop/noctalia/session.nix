{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.desktop.noctalia;
in
{
  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    programs.noctalia.settings.shell.session = {
      grid = true;
      actions = [
        {
          action = "lock_and_suspend";
          enabled = true;
          countdown_seconds = 0;
          shortcut = "1";
          variant = "default";
        }
        {
          action = "logout";
          enabled = true;
          countdown_seconds = 5;
          shortcut = "2";
          variant = "default";
        }
        {
          action = "shutdown";
          enabled = true;
          countdown_seconds = 5;
          shortcut = "3";
          variant = "default";
        }
        {
          action = "reboot";
          enabled = true;
          countdown_seconds = 5;
          shortcut = "4";
          variant = "default";
        }
        {
          action = "command";
          enabled = true;
          label = "Soft Reboot";
          glyph = "reload";
          command = "systemctl soft-reboot";
          countdown_seconds = 5;
          shortcut = "5";
          variant = "default";
        }
        {
          action = "command";
          enabled = true;
          label = "UEFI";
          glyph = "settings";
          command = "systemctl reboot --firmware-setup";
          countdown_seconds = 5;
          shortcut = "6";
          variant = "default";
        }
      ];
    };
  };
}
