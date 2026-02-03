{
  flake.modules.nixos.lix-ld = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
  };
}
