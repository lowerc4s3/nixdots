{
  flake.aspects.sys-nvidia = {
    nixos = {config, ...}: let
      driverPackage = config.boot.kernelPackages.nvidiaPackages.latest;
    in {
      # NOTE: using this for chainner
      programs.nix-ld.libraries = [driverPackage];

      services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        # NOTE: the default stable driver is a bit stale
        package = driverPackage;

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
