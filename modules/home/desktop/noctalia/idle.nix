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
    programs.noctalia.settings.idle = {
      behavior_order = [
        "screen-off"
        "lock"
        "lock-and-suspend"
      ];
      behavior.screen-off = {
        action = "screen_off";
        enabled = true;
        timeout = 300.0;
      };
      behavior.lock = {
        action = "lock";
        enabled = true;
        timeout = 600.0;
      };
      behavior.lock-and-suspend = {
        action = "lock_and_suspend";
        enabled = true;
        timeout = 900.0;
      };
    };

  };
}
