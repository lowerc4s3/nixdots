{
  inputs,
  flake,
  config,
  ...
}:
let
  inherit (config.stylix) cursor;
in
{
  imports = [ inputs.silentSDDM.nixosModules.default ];
  environment.systemPackages = [ cursor.package ];

  services.displayManager.sddm = {
    wayland.enable = true;
    settings.Theme = {
      CursorTheme = cursor.name;
      CursorSize = cursor.size;
    };
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";
    profileIcons.lowerc4s3 = flake + /config/face.jpg;
    backgrounds.square = flake + /config/life-death.jpg;
    settings = {
      LockScreen.background = "life-death.jpg";
      LoginScreen.background = "life-death.jpg";
    };
  };
}
