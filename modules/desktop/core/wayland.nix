{
  flake.modules.nixos.desktop-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
