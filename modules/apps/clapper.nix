{self, ...}: {
  flake.aspects.apps-clapper = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        clapper
      ];
    };

    homeManager = {
      xdg.mimeApps.defaultApplications =
        self.lib.setDefaultAppFor "com.github.rafostar.Clapper.desktop"
        (map (subtype: "video/${subtype}") [
          "mp4"
          "avi"
          "matroska"
          "x-matroska"
          "*"
        ]);
    };
  };
}
