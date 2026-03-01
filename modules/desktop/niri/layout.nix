{
  flake.modules.homeManager.niri-layout = {
    programs.niri.settings.layout = {
      gaps = 10;
      default-column-width.proportion = 1. / 2.;
      preset-column-widths = [
        {proportion = 1. / 3.;}
        {proportion = 1. / 2.;}
        {proportion = 2. / 3.;}
      ];

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        length.total-proportion = 0.98;
        gap = 10;
        width = 5;
        gaps-between-tabs = 5;
        corner-radius = 10;
      };

      focus-ring.width = 1;
    };
  };
}
