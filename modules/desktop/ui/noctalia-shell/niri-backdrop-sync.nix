{
  flake.modules.homeManager.noctalia-niri-backdrop-sync = {
    pkgs,
    config,
    ...
  }: {
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
