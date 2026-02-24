{
  flake.modules.nixos.kde = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # NOTE: temp location, will move somewhere else later
      wl-clipboard
    ];
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
    services.displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
  };
}
