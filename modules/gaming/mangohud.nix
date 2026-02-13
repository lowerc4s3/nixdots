{
  flake.modules.nixos.mangohud = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };

  flake.modules.homeManager.mangohud = {
    programs.mangohud = {
      enable = true;
    };
  };
}
