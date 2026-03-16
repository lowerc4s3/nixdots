{
  flake.aspects.apps-virtualbox = {
    nixos = {
      virtualisation.virtualbox.host = {
        enable = true;
      };
    };
  };
}
