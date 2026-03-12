{inputs, ...}: {
  # NOTE: only flakeModules are allowed here
  imports = [
    # flake-parts module system
    inputs.flake-parts.flakeModules.modules
    # home-manager flake-parts modules
    inputs.home-manager.flakeModules.home-manager

    inputs.flake-aspects.flakeModule
  ];

  systems = [
    "x86_64-linux"
    "x86_64-darwin"
  ];
}
