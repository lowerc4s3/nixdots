{
  flake,
  pkgs,
  ...
}: {
  imports = with flake.nixosModules; [
    niri
    noctalia
  ];

  environment.systemPackages = with pkgs; [
    nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };
}
