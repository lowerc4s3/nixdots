{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.atoms.desktop.niri;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ inputs.niri.nixosModules.niri ];

  options.atoms.desktop.niri = {
    enable = lib.mkEnableOption "niri window compositor";
    withNoctalia = lib.mkEnableOption "noctalia integration for niri";
  };

  config = mkIf (config.atoms.desktop.enable && cfg.enable) (mkMerge [
    {
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

    (mkIf cfg.withNoctalia {
      environment.systemPackages = with pkgs; [
        nautilus
      ];
      programs.nautilus-open-any-terminal = {
        enable = true;
        terminal = "foot";
      };
    })
  ]);
}
