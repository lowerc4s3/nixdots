{
  flake.modules.nixos.plymouth = {pkgs, ...}: {
    boot.plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
  };
}
