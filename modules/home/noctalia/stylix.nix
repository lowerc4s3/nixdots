{ config, lib, ... }:
{
  config = lib.mkIf config.stylix.enable {
    programs.noctalia.settings = {
      shell.font_family = config.stylix.fonts.sansSerif.name;
    };
  };
}
