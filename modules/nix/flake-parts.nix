{inputs, ...}: {
  imports = [
    # enable flake-parts module system
    inputs.flake-parts.flakeModules.modules
  ];

  # used systes architectures
  systems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
}
