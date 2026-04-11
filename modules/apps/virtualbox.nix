{
  flake.aspects.apps-virtualbox = {
    nixos = {
      # BUG: cannot build vbox modules on linux kernel 6.19
      # (see https://github.com/NixOS/nixpkgs/issues/491434)
      virtualisation.virtualbox.host = {
        enable = true;
      };
    };
  };
}
