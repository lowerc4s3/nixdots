{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.media;
in
{
  options.atoms.apps.media = {
    enable = lib.mkEnableOption "media apps like photo and video viewers";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      loupe
      cine
    ];
  };
}
