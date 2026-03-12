{
  flake.aspects.desktop-noctalia = {
    homeManager = {
      programs.noctalia-shell.settings.bar = {
        position = "left";
        density = "comfortable";
        displayMode = "always_visible";
        showCapsule = false; # show bar widgets background
        showOutline = false;
        widgetSpacing = 4;
        contentPadding = 2;

        mouseWheelAction = "none";
        leftClickAction = "none";
        rightClickAction = "none";

        widgets.left = [
          {
            id = "Launcher";
            icon = "layout-grid-filled";
          }
          {
            id = "Workspace";
            pillSize = 0.4;
            labelMode = "none";
            showApplications = false;
            enableScrollWheel = false;
            focusedColor = "none";
            occupiedColor = "none";
            emptyColor = "none";
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
            pinned = ["tray-icon tray app main"];
          }
          {
            id = "KeyboardLayout";
            displayMode = "forceOpen";
            showIcon = true;
          }
          {
            id = "Volume";
            displayMode = "onhover";
          }
          {
            id = "Network";
          }
          {
            id = "Battery";
            hideIfNotDetected = true;
          }
          {
            id = "NotificationHistory";
            showUnreadBadge = true;
          }
          {
            id = "ControlCenter";
            icon = "adjustments";
          }
        ];
      };
    };
  };
}
