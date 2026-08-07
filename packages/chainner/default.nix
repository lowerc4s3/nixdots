{ pkgs, pname, ... }:
let
  unwrapped = pkgs.callPackage ./unwrapped.nix { inherit pname; };
in
pkgs.callPackage (
  { buildFHSEnv, ... }:
  buildFHSEnv {
    inherit (unwrapped) pname version meta;

    multiPkgs =
      p: with p; [
        unwrapped
        zlib
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
        libGL
        libgbm
        libdrm
        libx11
        libxkbcommon
        libxcb
        libxcomposite
        libxdamage
        libxfixes
        libxrandr
        libxext
        libnotify
        gvfs
        udev
      ];

    runScript = "chainner";
    extraInstallCommands = ''
      mkdir -p $out/share
      ln -s ${unwrapped}/share/applications $out/share
      ln -s ${unwrapped}/share/icons $out/share
    '';
  }
) { }
