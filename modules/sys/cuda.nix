{
  flake.aspects.sys-cuda = {
    nixos = {pkgs, ...}: {
      nix.settings = {
        substituters = [
          "https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
      };

      environment.systemPackages = with pkgs.cudaPackages; [
        cudatoolkit
        cudnn
      ];

      programs.nix-ld.libraries = with pkgs.cudaPackages; [
        cudatoolkit
        cudnn
      ];
    };
  };
}
