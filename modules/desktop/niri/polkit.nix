{
  flake.modules.nixos.desktop-niri = {
    # disable niri-flake default polkit (kde polkit)
    systemd.user.services.niri-flake-polkit.enable = false;
    security.soteria.enable = true;
  };
}
