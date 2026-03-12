{
  flake.aspects.desktop-niri.nixos = {
    # disable niri-flake default polkit (kde polkit)
    systemd.user.services.niri-flake-polkit.enable = false;
    security.soteria.enable = true;
  };
}
