{inputs, ...}: {
  flake.aspects.desktop-core = {
    nixos = {
      services.displayManager.sddm = {
        autoNumlock = true;

        # NOTE: for some reason sddm doesn't start with weston
        wayland.compositor = "kwin";
      };

      imports = [inputs.silentSDDM.nixosModules.default];
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
