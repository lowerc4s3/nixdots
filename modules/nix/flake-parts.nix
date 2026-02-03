{inputs, ...}: {
  imports = [
    # enable flake-parts module system
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];

  # used systes architectures
  systems = [
    "x86_64-linux"
    "x86_64-darwin"
  ];
}
