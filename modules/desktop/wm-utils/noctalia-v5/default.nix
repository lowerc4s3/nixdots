{inputs, ...}: {
  flake.aspects.desktop-noctalia-v5 = {
    nixos = {
      nix.settings = {
        extra-substituters = ["https://noctalia.cachix.org"];
        extra-trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
      };
    };

    homeManager = {
      imports = [inputs.noctalia-v5.homeModules.default];
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
