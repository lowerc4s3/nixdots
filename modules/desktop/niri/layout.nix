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
    };
  };
}
