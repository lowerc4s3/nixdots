{inputs, ...}: {
  flake.aspects.dev-rust = {
    nixos = {pkgs, ...}: {
      nixpkgs.overlays = [inputs.fenix.overlays.default];
      nix.settings = {
        substituters = ["https://fenix.cachix.org"];
        trusted-public-keys = ["fenix.cachix.org-1:ecJhr+RdYEdcVgUkjruiYhjbBloIEGov7bos90cZi0Q="];
      };

      environment.systemPackages = with pkgs; [
        fenix.complete.toolchain
      ];
    };
  };
}
