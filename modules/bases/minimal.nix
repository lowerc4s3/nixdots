{inputs, ...}: {
  flake.modules.nixos.base-minimal = {
    imports = with inputs.self.modules.nixos; [
      firmware
      locale
      nixconf
      network
      nix-ld
      shell
      cli
    ];
  };

  flake.modules.darwin.base-minimal = {
    imports = with inputs.self.modules.darwin; [
      nixconf
      network
    ];
  };

  flake.modules.homeManager.base-minimal = {
    imports = with inputs.self.modules.homeManager; [
      xdg
      zsh
    ];
  };
}
