{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.plymouth;
in
{
  options.atoms.system.plymouth = {
    enable = lib.mkEnableOption "the plymouth boot splash screen";
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    boot.kernelParams = [ "quiet" ];
    boot.plymouth = {
      enable = true;
    };
  };
}
