{
  flake.modules.nixos.cli-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      fd
    ];
  };

  flake.modules.homeManager.cli-core = {
    programs.fd = {
      enable = true;
      ignores = [".git/"];
    };
  };
}
