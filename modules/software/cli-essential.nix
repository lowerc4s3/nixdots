{
  flake.modules.nixos.cli-essential = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      neovim
    ];
  };
}
