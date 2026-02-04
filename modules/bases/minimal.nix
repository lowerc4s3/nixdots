{self, ...}: {
  flake.modules.nixos.base-minimal = {
    imports = with self.modules.nixos; [
      firmware
      locale
      nixconf
      network
      nix-ld
      zsh
      cli-essential
    ];
  };

  flake.modules.darwin.base-minimal = {
    imports = with self.modules.darwin; [
      nixconf
      network
    ];
  };

  flake.modules.homeManager.base-minimal = {
    imports = with self.modules.homeManager; [
      xdg
      zsh
    ];
  };
}
