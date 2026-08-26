{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.iloader;
in
{
  options.atoms.apps.iloader = {
    enable = lib.mkEnableOption "iloader, the ios sideloader";
  };

  config = lib.mkIf cfg.enable {
    services.usbmuxd.enable = true;
    environment.systemPackages = with pkgs; [
      iloader
    ];
  };
}
