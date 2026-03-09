{
  flake.modules.homeManager.desktop-niri = {
    lib,
    pkgs,
    ...
  }: {
    programs.niri.settings = {
      prefer-no-csd = true; # disable window deco
      overview = {
        zoom = 0.5;
      };

      cursor = {
        hide-when-typing = true;
      };

      environment = {
        # Enable wayland for glfw
        XDG_SESSION_TYPE = "wayland";

        # Qt fallback to X11
        QT_QPA_PLATFORM = "wayland;xcb";

        # Disable Qt window decorations
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

        # Use theme from qt6ct
        QT_QPA_PLATFORMTHEME = "qt6ct";

        # GTK fallback to X11 or another backend
        GDK_BACKEND = "wayland,x11,*";
      };

      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

      hotkey-overlay.skip-at-startup = true;
      clipboard.disable-primary = true;

      # fix discord/telegram/etc not focusing
      # when clicking on notif or tray icon
      debug.honor-xdg-activation-with-invalid-serial = [];
    };
  };
}
