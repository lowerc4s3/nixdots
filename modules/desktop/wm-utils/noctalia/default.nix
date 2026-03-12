{inputs, ...}: {
  flake.aspects.desktop-noctalia.homeManager = {
    imports = [inputs.noctalia.homeModules.default];
    programs.noctalia-shell = {
      enable = true;
    };
  };
}
