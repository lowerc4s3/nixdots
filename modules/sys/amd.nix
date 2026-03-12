{
  flake.aspects.sys-amd = {
    nixos = {
      hardware = {
        cpu.amd.updateMicrocode = true;
      };
      # use modern amd performance scaling driver
      boot.kernelParams = ["amd_pstate=active"];
    };
  };
}
