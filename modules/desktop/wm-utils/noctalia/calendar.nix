{
  flake.modules.homeManager.desktop-noctalia = {
    programs.noctalia-shell.settings.calendar = {
      cards = [
        {
          id = "calendar-header-card";
          enabled = true;
        }
        {
          id = "calendar-month-card";
          enabled = true;
        }
        {
          id = "weather-card";
          enabled = false;
        }
      ];
    };
  };
}
