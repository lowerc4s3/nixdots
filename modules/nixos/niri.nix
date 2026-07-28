{ inputs, pkgs, ... }:
{
  imports = [ inputs.niri.nixosModules.niri ];
  niri-flake.cache.enable = false;
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # disable niri-flake default polkit (kde polkit)
  systemd.user.services.niri-flake-polkit.enable = false;
  security.soteria.enable = true;
}
