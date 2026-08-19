{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.system.network;
  inherit (lib) types;
in
{
  options.atoms.system.network = {
    enable = lib.mkEnableOption "network management" // {
      default = true;
    };
    nameservers = lib.mkOption {
      description = "The list of nameservers";
      type = with types; listOf str;
      default = [
        "8.8.8.8"
        "8.8.4.4"
        "2001:4860:4860::8888"
        "2001:4860:4860::8844"
      ];
    };
    # we can also define a wireless option here
  };

  config = lib.mkIf (config.atoms.system.enable && cfg.enable) {
    networking.networkmanager = {
      enable = true;
      insertNameservers = cfg.nameservers;
    };
  };
}
