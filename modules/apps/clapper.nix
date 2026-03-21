{
  flake.aspects.apps-clapper = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        clapper
      ];
    };

    homeManager = {
      xdg.mimeApps.defaultApplications = {
        "video/*" = "com.github.rafostart.Clapper";
      };
    };
  };
}
