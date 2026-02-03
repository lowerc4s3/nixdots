{
  flake.modules.nixos.cli = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      neovim
    ];
  };
}
