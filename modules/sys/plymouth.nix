{
  flake.modules.nixos.sys-plymouth = {pkgs, ...}: {
    boot.kernelParams = ["quiet"];
    boot.plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
  };
}
