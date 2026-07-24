{
  flake.aspects.sys-printing = {
    nixos = {pkgs, ...}: {
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
          cups-pdf.enable = true;
        };

        avahi = {
          enable = true;
          nssmdns4 = true;
        };
      };
    };
  };
}
