{
  flake.aspects.apps-chainner = {
    nixos = {pkgs, ...}: {
      # NOTE: this module DOES NOT PROVIDE packaged chaiNNer but rather a nix-ld
      # runtime libraries to make the portable version runnable and usable
      programs.nix-ld.libraries = with pkgs; [
        gtk3
        glib
        dbus
        cairo
        pango
        atk
        at-spi2-atk
        nss
        nspr
        cups
        expat
        alsa-lib

        libgbm
        libdrm
        libGL
        libva

        libx11
        libxkbcommon
        libxcb
        libxcomposite
        libxdamage
        libxfixes
        libxrandr
        libxext
        libxxf86vm
        libxshmfence
      ];
    };
  };
}
