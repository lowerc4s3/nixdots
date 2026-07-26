{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # disable niri-flake default polkit (kde polkit)
  systemd.user.services.niri-flake-polkit.enable = false;
  security.soteria.enable = true;
}
