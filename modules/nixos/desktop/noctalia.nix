{
  config,
  lib,
  ...
}:
let
  cfg = config.atoms.desktop.noctalia;
in
{
  options.atoms.desktop.noctalia = {
    enable = lib.mkEnableOption "noctalia shell";
    cache.enable = lib.mkEnableOption "noctalia binary cache";
  };

  config = lib.mkIf (config.atoms.desktop.enable && cfg.enable) {
    nix.settings = lib.mkIf cfg.cache.enable {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };
}
