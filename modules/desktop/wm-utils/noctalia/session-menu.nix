{
  flake.aspects.desktop-noctalia.homeManager = {
    programs.noctalia-shell.settings.sessionMenu = let
      mkPowerOpts = action: keybind: opts:
        {
          inherit action keybind;
          enabled = true;
          command = "";
        }
        // opts;
    in {
      largeButtonsStyle = true;
      largeButtonsLayout = "grid";
      enableCountdown = true;
      countdownDuration = 5000;
      showKeybinds = true;
      powerOptions = [
        (mkPowerOpts "lock" "1" {countdownEnabled = false;})
        (mkPowerOpts "suspend" "2" {countdownEnabled = false;})
        (mkPowerOpts "logout" "3" {})
        (mkPowerOpts "shutdown" "4" {})
        (mkPowerOpts "reboot" "5" {})
        (mkPowerOpts "rebootToUefi" "6" {})
      ];
    };
  };
}
