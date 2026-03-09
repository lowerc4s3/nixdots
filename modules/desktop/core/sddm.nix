{inputs, ...}: {
  flake.modules.nixos.desktop-core = {
    imports = [inputs.silentSDDM.nixosModules.default];
    services.displayManager.sddm.wayland.compositor = "kwin";
    programs.silentSDDM = {
      enable = true;
      theme = "default";
      # TODO: avatar
    };
  };
}
