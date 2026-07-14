{
  flake.aspects.desktop-stylix = {
    homeManager = {config, ...}: {
      stylix.targets.foot = {
        colors.enable = false;
        opacity.enable = false;
      };

      # stylix provides foot module i define
      # my own one to use base24 colors
      programs.foot.settings.colors-dark = with config.lib.stylix.colors; {
        alpha = config.stylix.opacity.terminal;
        foreground = base05;
        background = base00;
        regular0 = base01;
        regular1 = red;
        regular2 = green;
        regular3 = yellow;
        regular4 = blue;
        regular5 = magenta;
        regular6 = cyan;
        regular7 = base05;
        bright0 = base03;
        bright1 = bright-red;
        bright2 = bright-green;
        bright3 = bright-yellow;
        bright4 = bright-blue;
        bright5 = bright-magenta;
        bright6 = bright-cyan;
        bright7 = base07;
      };
    };
  };
}
