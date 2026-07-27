{pkgs, ...}: {
  # disable nix-manual desktop entry and html docs
  documentation.doc.enable = false;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  services = {
    udisks2 = {
      enable = true;
      settings = {
        "mount_options.conf".defaults = {
          ntfs_drivers = "ntfs";
        };
      };
    };

    gvfs.enable = true;
    # TODO: nix-flatpak for declarative mgmt
    flatpak.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
