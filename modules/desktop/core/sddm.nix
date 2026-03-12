{inputs, ...}: {
  flake.aspects.desktop-core = {
    nixos = {
      imports = [inputs.silentSDDM.nixosModules.default];
      services.displayManager.sddm.wayland.compositor = "kwin";
      programs.silentSDDM = {
        enable = true;
        theme = "default";
        # TODO: avatar
      };
    };
  };
}
