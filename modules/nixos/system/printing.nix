{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.printing;
  inherit (lib) types;
in
{
  options.atoms.system.printing = {
    enable = lib.mkEnableOption "CUPS and SANE setup";
    drivers = lib.mkOption {
      description = "List of printer and scanner drivers";
      type = with types; listOf package;
      default = [ ];
    };
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    hardware.sane = {
      enable = true;
      extraBackends = cfg.drivers;
    };

    services = {
      ipp-usb.enable = true;
      printing = {
        enable = true;
        drivers = cfg.drivers;
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
      };
    };
  };
}
