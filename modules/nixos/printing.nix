{ pkgs, ... }: {
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplip
    ];
  };

  services = {
    ipp-usb.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
