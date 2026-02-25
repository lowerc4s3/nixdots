{
  self,
  lib,
  ...
}: {
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
      clash-verge
      gvfs
      foot
    ];

    # use zen kernel on desktops
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
    boot.kernelParams = ["quiet"];
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
      foot
    ];
  };
}
