{lib, ...}: {
  flake.modules.nixos.nvidia = {config, ...}: {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      # NOTE: the default stable driver is a bit stale
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;

      # Enable nvidia-suspend/hibernate/resume services
      # and set NVreg_PreserveVideoMemoryAllocations
      powerManagement.enable = true;
    };
  };
}
