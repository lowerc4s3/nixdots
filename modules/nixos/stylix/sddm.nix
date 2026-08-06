{ config, ... }:
let
  inherit (config.stylix) cursor;
in
{
  environment.systemPackages = [ cursor.package ];
  services.displayManager.sddm.settings.Theme = {
    CursorTheme = cursor.name;
    CursorSize = cursor.size;
  };
}
