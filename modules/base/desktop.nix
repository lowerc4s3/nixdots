{self, ...}: {
  flake.modules.nixos.base-desktop = {
    pkgs,
    lib,
    ...
  }: {
    imports = with self.modules.nixos; [
      base-cli
      apps-core
      desktop-core
      sys-plymouth
      sys-grub
      desktop-stylix
    ];

    # use zen kernel on desktops
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
  };

  flake.modules.darwin.base-desktop = {
    imports = with self.modules.darwin; [
      base-cli
      desktop-core
    ];
  };

  flake.modules.homeManager.base-desktop = {
    imports = with self.modules.homeManager; [
      base-cli
      apps-core
      desktop-core
      desktop-stylix
    ];
  };
}
