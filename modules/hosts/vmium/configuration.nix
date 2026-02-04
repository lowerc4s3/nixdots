{
  inputs,
  self,
  ...
}: let
  hostname = "vmium";
in {
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules; [
      nixos.${hostname}
    ];
  };

  flake.modules.nixos.${hostname} = {pkgs, ...}: {
    networking.hostName = "${hostname}";
    imports = with self.modules.nixos; [
      base-desktop
      base-develop

      systemd-boot
      lowerc4s3
      kde
    ];

    # enable periodic ssd trim
    services.fstrim.enable = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
    time.timeZone = "Europe/Moscow";

    system.stateVersion = "25.11";
  };
}
