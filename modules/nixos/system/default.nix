{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.atoms.system;
in
{
  imports = [
    ./audio.nix
    ./dualboot.nix
    ./graphics.nix
    ./network.nix
    ./network.nix
    ./plymouth.nix
    ./printing.nix
    ./users.nix
  ];

  options.atoms.system = {
    enable = lib.mkEnableOption "basic system setup";
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = lib.mkDefault true;

    hardware = {
      enableAllFirmware = true;
      enableRedistributableFirmware = true;
    };

    i18n = {
      defaultLocale = "ru_RU.UTF-8";
      extraLocales = [ "en_US.UTF-8/UTF-8" ];
      extraLocaleSettings = {
        LC_ADDRESS = "ru_RU.UTF-8";
        LC_IDENTIFICATION = "ru_RU.UTF-8";
        LC_MEASUREMENT = "ru_RU.UTF-8";
        LC_MONETARY = "ru_RU.UTF-8";
        LC_NAME = "ru_RU.UTF-8";
        LC_NUMERIC = "ru_RU.UTF-8";
        LC_PAPER = "ru_RU.UTF-8";
        LC_TELEPHONE = "ru_RU.UTF-8";
        LC_TIME = "ru_RU.UTF-8";
      };
    };

    # use latest nix version
    nixpkgs.overlays = [ (final: prev: { nix = final.nixVersions.latest; }) ];
    nix = {
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
          "pipe-operators"
        ];
        trusted-users = [ "@wheel" ];
      };
    };
  };
}
