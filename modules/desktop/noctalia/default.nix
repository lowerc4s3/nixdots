{inputs, ...}: {
  flake.modules.homeManager.desktop-noctalia = {
    imports = [inputs.noctalia.homeModules.default];
    programs.noctalia-shell = {
      enable = true;
    };
  };
}
