{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.bar = {
      position = "left";
      density = "comfortable";
      displayMode = "always_visible";
      showCapsule = false; # show bar widgets background
      showOutline = false;
      widgetSpacing = 4;
      contentPadding = 2;

      widgets.left = [
        {
          id = "Workspace";
          pillSize = 0.4;
          labelMode = "none";
          showApplications = false;
          enableScrollWheel = true;
        }
      ];

      widgets.center = [
        {
          id = "Clock";
          useCustomFont = true;
          formatVertical = "HH mm — dd MM";
          tooltipFormat = "HH:mm ddd, MMM dd";
        }
      ];

      widgets.right = [
        {
          id = "Tray";
          pinned = ["tray-icon tray app"];
        }
        {
          id = "KeyboardLayout";
          diplayMode = "forceOpen";
          showIcon = false;
        }
        {
          id = "NotificationHistory";
          showUnreadBadge = true;
        }
        {
          id = "Volume";
          displayMode = "onhover";
        }
        {
          id = "ControlCenter";
          icon = "settings-2";
        }
      ];
    };
  };
}
