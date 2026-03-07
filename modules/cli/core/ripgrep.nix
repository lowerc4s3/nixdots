{
  flake.modules.nixos.cli-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ripgrep
    ];
  };
}
