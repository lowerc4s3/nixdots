{lib, ...}: {
  flake.modules.nixos.nvidia = {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = lib.mkDefault true;
      nvidiaSettings = true;

      # Enable nvidia-suspend/hibernate/resume services
      # and set NVreg_PreserveVideoMemoryAllocations
      powerManagement.enable = true;
    };
  };
}
