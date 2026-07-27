{ lib, config, ... }:
{
  config = lib.mkIf config.stylix.enable {
    stylix.targets.qutebrowser.colors.override.withHashtag = {
      base01 = "#161616";
      base03 = "#262626";
    };
  };
}
