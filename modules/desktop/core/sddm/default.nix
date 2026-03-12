{inputs, ...}: {
  flake.aspects.desktop-core = {
    nixos = {
      imports = [inputs.silentSDDM.nixosModules.default];
      services.displayManager.sddm.wayland.compositor = "kwin";
      programs.silentSDDM = {
        enable = true;
        theme = "default";
        profileIcons.lowerc4s3 = ./face.jpg;
        backgrounds.square = ./life-death.jpg;
        settings = {
          LockScreen.background = "life-death.jpg";
          LoginScreen.background = "life-death.jpg";
        };
      };
    };
  };
}
