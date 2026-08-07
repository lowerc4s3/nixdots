{ inputs, pkgs, ... }:
{
  imports = [ inputs.niri.nixosModules.niri ];
  niri-flake.cache.enable = false;
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.sessionVariables = {
    # Enable wayland for glfw
    XDG_SESSION_TYPE = "wayland";
    # Qt fallback to X11
    QT_QPA_PLATFORM = "wayland;xcb";
    # Disable Qt window decorations
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # Use wayland for electron apps
    NIXOS_OZONE_WL = "1";
  };

  # disable niri-flake default polkit (kde polkit)
  systemd.user.services.niri-flake-polkit.enable = false;
  security.soteria.enable = true;
}
