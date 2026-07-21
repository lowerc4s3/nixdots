{inputs, ...}: {
  flake.aspects.desktop-core = {
    nixos = {
      services.displayManager.sddm = {
        autoNumlock = true;

        wayland = {
          enable = true;
          compositor = "weston";
        };
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
