{
  lib,
  config,
  pkgs,
  flake,
  ...
}:
let
  cfg = config.atoms.desktop;
in
{
  imports = [
    flake.nixosModules.cli
    flake.nixosModules.apps
    flake.nixosModules.stylix
    ./niri.nix
    ./sddm.nix
  ];

  options.atoms.desktop = {
    enable = lib.mkEnableOption "basic desktop setup";
  };

  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [ flake.homeModules.desktop ];

    # use zen kernel on desktops
    # BUG: kernel panic at boot on zen kernel 7.3.4 as of 12.11.2026
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_latest;

    # disable nix-manual desktop entry and html docs
    documentation.doc.enable = false;

    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services = {
      udisks2 = {
        enable = true;
        settings."mount_options.conf".defaults = {
          ntfs_drivers = "ntfs";
        };
      };

      # TODO: nix-flatpak for declarative mgmt
      flatpak.enable = true;
      gvfs.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
