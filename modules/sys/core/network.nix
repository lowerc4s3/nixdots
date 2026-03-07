let
  nameservers = [
    "8.8.8.8"
    "8.8.4.4"
    "2001:4860:4860::8888"
    "2001:4860:4860::8844"
  ];
in {
  flake.modules.nixos.sys-core = {
    networking.networkmanager = {
      enable = true;
      insertNameservers = nameservers;
    };
  };

  flake.modules.darwin.sys-core = {
    networking.dns = nameservers;
  };
}
