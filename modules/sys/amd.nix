{
  flake.modules.nixos.sys-amd = {
    hardware = {
      cpu.amd.updateMicrocode = true;
    };
    # use modern amd performance scaling driver
    boot.kernelParams = ["amd_pstate=active"];
  };
}
