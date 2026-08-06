{
  inputs,
  flake,
  ...
}:
{
  imports = [ inputs.silentSDDM.nixosModules.default ];

  services.displayManager.sddm = {
    wayland.enable = true;
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
