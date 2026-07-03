{
  flake.aspects.sys-nvidia = {
    nixos = {
      services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        branch = "latest";

        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;

        # Enable nvidia-suspend/hibernate/resume services
        # and set NVreg_PreserveVideoMemoryAllocations
        powerManagement.enable = true;
      };
    };
  };
}
