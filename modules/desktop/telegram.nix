{
  flake.modules.nixos.telegram = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];
  };
}
