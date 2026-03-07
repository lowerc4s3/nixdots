{
  flake.modules.nixos.sys-core = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
  };
}
