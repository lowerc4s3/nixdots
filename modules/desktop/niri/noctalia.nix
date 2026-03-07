{self, ...}: {
  flake.modules.homeManager.desktop-niri = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.modules.homeManager; [
      desktop-noctalia
    ];

    # use blurred noctalia wallpapers as a niri's overview backdrop
    services.swww.enable = true;
    programs.niri.settings = {
      layer-rules = [
        {
          matches = [{namespace = "^swww-daemon$";}];
          place-within-backdrop = true;
        }
      ];
    };
    home.packages = with pkgs; [
      (writeShellApplication {
        name = "sync-backdrop";
        runtimeInputs = [imagemagick swww jq];
        text = let
          wallpaperJsonPath = config.xdg.cacheHome + "/noctalia/wallpapers.json";
          blurredWallpaperPath = config.xdg.cacheHome + "/backdrop-blurred.png";
        in ''
          wallpaper_path="$(jq --raw-output '.wallpapers."DP-1"' ${wallpaperJsonPath})"
          magick "$wallpaper_path" -scale 10% -blur 0x2.5 -resize 1000% ${blurredWallpaperPath}
          swww img -t none ${blurredWallpaperPath}
        '';
      })
    ];
  };
}
