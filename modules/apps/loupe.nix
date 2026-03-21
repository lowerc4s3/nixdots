{self, ...}: {
  flake.aspects.apps-loupe = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        loupe
      ];
    };

    homeManager = {
      xdg.mimeApps.defaultApplications =
        self.lib.setDefaultAppFor "org.gnome.Loupe.desktop"
        (map (subtype: "image/${subtype}") [
          "apng"
          "png"
          "jpeg"
          "jxl"
          "gif"
          "tiff"
          "bmp"
        ]);
    };
  };
}
