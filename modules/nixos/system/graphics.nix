{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.graphics;
  inherit (lib) mkIf mkMerge;
in
{
  options.atoms.system.graphics = {
    nvidia = {
      enable = lib.mkEnableOption "nvidia driver setup";
      legacy = lib.mkEnableOption "legacy proprietary drivers for GTX 9xx and 10xx series";
    };
  };

  config = mkIf config.atoms.system.enable (mkMerge [
    (mkIf cfg.nvidia.enable {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        branch = if cfg.nvidia.legacy then "legacy_580" else "latest";

        modesetting.enable = true;
        open = !cfg.nvidia.legacy;
        nvidiaSettings = false;

        # Enable nvidia-suspend/hibernate/resume services
        # and set NVreg_PreserveVideoMemoryAllocations
        powerManagement.enable = lib.mkDefault true;
      };
    })
  ]);
}
