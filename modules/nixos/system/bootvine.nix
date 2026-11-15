{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.bootvine;
in
{
  options.atoms.system.bootvine = {
    enable = lib.mkEnableOption "bootvine, the systemd dep tree on boot console";
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    assertions = lib.singleton {
      assertion = !config.atoms.system.plymouth.enable;
      message = ''
        Plymouth and bootvine both replace default boot animation
        and probably conflict with each other.
      '';
    };

    services.bootvine = {
      enable = true;
      settings.timing.keep-final-frame-for = "500ms";
    };
  };
}
