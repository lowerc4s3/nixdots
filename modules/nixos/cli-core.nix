{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.overlays = [ inputs.nvx.overlays.default ];

  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    psmisc
    file
    git
    neovim-nvx
  ];

  home-manager.backupCommand = lib.getExe pkgs.trashy;
}
