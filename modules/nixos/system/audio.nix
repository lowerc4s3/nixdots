{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.audio;
in
{
  options.atoms.system.audio.enable = lib.mkEnableOption "audio management with pipewire" // {
    default = true;
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
