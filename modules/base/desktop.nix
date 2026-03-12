{
  flake.aspects = {aspects, ...}: {
    base-desktop = {
      includes = with aspects; [
        base-cli

        sys-plymouth
        sys-grub

        desktop-core
        desktop-stylix
        apps-core
      ];

      nixos = {
        pkgs,
        lib,
        ...
      }: {
        # use zen kernel on desktops
        boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
      };
    };
  };
}
