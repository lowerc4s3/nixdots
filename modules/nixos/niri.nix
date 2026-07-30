{ inputs, pkgs, ... }:
let
  # INFO: broken build already fixed on main as of 28.07.2026,
  # should be in unstable soon (cached i hope)
  libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
    src = pkgs.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "emersion";
      repo = "libdisplay-info";
      rev = finalAttrs.version;
      sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
    };
  });
in
{
  imports = [ inputs.niri.nixosModules.niri ];
  niri-flake.cache.enable = false;
  programs.niri = {
    enable = true;
    package = pkgs.niri.override { inherit libdisplay-info; };
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
