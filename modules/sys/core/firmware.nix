{
  flake.aspects.sys-core = {
    nixos = {
      hardware = {
        enableAllFirmware = true;
        enableRedistributableFirmware = true;
      };
    };
  };
}
