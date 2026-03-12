{
  flake.aspects.sys-core.nixos = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };
  };
}
