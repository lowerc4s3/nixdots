{
  flake.aspects.desktop-niri.homeManager = {
    programs.niri.settings.layout = {
      always-center-single-column = true;
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

      gaps = 10;
      struts = {
        left = 25;
        right = 25;
        top = 15;
        bottom = 15;
      };
    };
  };
}
