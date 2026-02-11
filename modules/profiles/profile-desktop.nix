{self, lib, ...}: {
  flake.modules.nixos.profile-desktop = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      profile-cli
      grub
      plymouth
      audio
      fonts
      appimage
      librewolf
      telegram
      v2raya
      gvfs
    ];

    # use zen kernel on desktops
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
  };

  flake.modules.darwin.profile-desktop = {
    imports = with self.modules.darwin; [
      profile-cli
    ];
  };

  flake.modules.homeManager.profile-desktop = {
    imports = with self.modules.homeManager; [
      profile-cli

      librewolf
    ];
  };
}
