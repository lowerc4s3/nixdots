{ inputs, pkgs, ... }:
{
  imports = [ inputs.niri.nixosModules.niri ];
  niri-flake.cache.enable = false;
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.sessionVariables = {
    # Enable wayland for glfw
    XDG_SESSION_TYPE = "wayland";
    # Qt fallback to X11
    QT_QPA_PLATFORM = "wayland;xcb";
    # Disable Qt window decorations
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # GTK fallback to X11 or another backend
    GDK_BACKEND = "wayland,x11,*";
    # Use wayland for electron apps
    NIXOS_OZONE_WL = "1";
  };

  # disable niri-flake default polkit (kde polkit)
  systemd.user.services.niri-flake-polkit.enable = false;
  security.soteria.enable = true;
}
