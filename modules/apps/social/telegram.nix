{
  flake.modules.nixos.apps-social = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];
  };
}
