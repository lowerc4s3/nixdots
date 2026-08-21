{
  lib,
  config,
  inputs,
  flake,
  ...
}:
let
  cfg = config.atoms.desktop.sddm;
in
{
  imports = [ inputs.silentSDDM.nixosModules.default ];

  options.atoms.desktop.sddm = {
    # NOTE: display manager should be mutualy exclusive
    enable = lib.mkEnableOption "sddm display manager";
  };

  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    services.displayManager.sddm = {
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };

    programs.silentSDDM = {
      enable = true;
      theme = "default";
      # TODO: get it from nix options
      profileIcons.lowerc4s3 = flake + /config/face.jpg;
      backgrounds.square = flake + /config/life-death.jpg;
      settings = {
        LockScreen.background = "life-death.jpg";
        LoginScreen.background = "life-death.jpg";
      };
    };
  };
}
