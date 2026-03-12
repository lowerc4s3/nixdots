{inputs, ...}: {
  # NOTE: only flakeModules are allowed here
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
    inputs.flake-aspects.flakeModule
  ];

  systems = [
    "x86_64-linux"
    "x86_64-darwin"
  ];
}
