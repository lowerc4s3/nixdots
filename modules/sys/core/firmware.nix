{
  flake.modules.nixos.sys-core = {
    hardware = {
      enableAllFirmware = true;
      enableRedistributableFirmware = true;
    };
  };
}
