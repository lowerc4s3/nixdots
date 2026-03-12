{
  flake.aspects.cli-core = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        fd
      ];
    };

    homeManager = {
      programs.fd = {
        enable = true;
        ignores = [".git/"];
      };
    };
  };
}
