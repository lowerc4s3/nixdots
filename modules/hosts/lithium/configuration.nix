{inputs, ...}: let
  hostname = "lithium";
in {
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    modules = with inputs.self.modules; [
      nixos.${hostname}
    ];
  };

  flake.modules.nixos.${hostname} = {pkgs, ...}: {
    networking.hostName = "${hostname}";
    imports = with inputs.self.modules.nixos; [
      base-desktop

      systemd-boot
      nvidia
      amd
      lowerc4s3
    ];

    # enable periodic ssd trim
    services.fstrim.enable = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
    supportedFileSystems = ["ntfs"];
    time.timeZone = "Europe/Moscow";

    system.stateVersion = "25.11";
  };
}
