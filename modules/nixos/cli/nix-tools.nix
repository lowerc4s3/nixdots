{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.atoms.cli.nix;
in
{
  imports = [ inputs.nix-index-database.nixosModules.default ];

  options.atoms.cli.nix = {
    enable = lib.mkEnableOption "additional nix-related tools";
  };

  config = lib.mkIf (config.atoms.cli.enable && cfg.enable) {
    programs = {
      nix-index-database = {
        enable = true;
        comma.enable = true;
      };

      nh.enable = true;
    };

    environment = {
      sessionVariables = {
        # env vars for nh
        NH_ASK = "1";
        NH_SHOW_ACTIVATION_LOGS = "1";
      };
      systemPackages = with pkgs; [
        nix-output-monitor
      ];
    };
  };
}
