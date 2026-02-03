let
  nameservers = [
    "8.8.8.8"
    "8.8.4.4"
    "2001:4860:4860::8888"
    "2001:4860:4860::8844"
  ];
in {
  flake.modules.nixos.network = {
    networking = {
      nameservers = nameservers;
      networkmanager = {
        enable = true;
      };

      # services.openssh.enable = true;
    };
  };

  flake.modules.darwin.network = {
    networking.dns = nameservers;
  };
}
