{
  flake.aspects.apps-gnome-disks = {
    nixos = {
      programs.gnome-disks.enable = true;
    };
  };
}
