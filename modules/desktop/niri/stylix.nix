{
  # some niri-flake stylix overrides
  flake.aspects.desktop-niri.homeManager = {
    config,
    lib,
    ...
  }: {
    config = lib.mkIf config.stylix.enable {
      programs.niri.settings = {
        # niri-flake's stylix module uses borders by default
        # and sets focus ring to false
        layout.border.enable = false;
        layout.focus-ring = let
          inherit (config.lib.stylix.colors) withHashtag;
        in {
          enable = true;
          active.color = withHashtag.base0D;
          inactive.color = withHashtag.base03;
          urgent.color = withHashtag.base08;
        };
      };
    };
  };
}
