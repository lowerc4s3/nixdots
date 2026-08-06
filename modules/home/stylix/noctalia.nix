{ lib, config, ... }:
{
  config = lib.mkIf (config.programs ? noctalia) {
    programs.noctalia.settings.shell.font_family = config.stylix.fonts.sansSerif.name;
  };
}
