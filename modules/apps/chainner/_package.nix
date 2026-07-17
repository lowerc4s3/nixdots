{
  stdenv,
  lib,
  fetchurl,

  dpkg,
  wrapGAppsHook3,
  makeWrapper,

  gtk3,
  glib,
  dbus,
  cairo,
  pango,
  atk,
  at-spi2-atk,
  nss,
  nspr,
  cups,
  expat,
  alsa-lib,
  libGL,
  libgbm,
  libdrm,
  libx11,
  libxkbcommon,
  libxcb,
  libxcomposite,
  libxdamage,
  libxfixes,
  libxrandr,
  libxext,
  libnotify,
  gvfs,
  udev,
  ...
}: stdenv.mkDerivation rec {
  pname = "chainner";
  version = "nightly.2026-02-23";
  src = fetchurl {
    url = "https://github.com/chaiNNer-org/chaiNNer-nightly/releases/download/2026-02-23/chaiNNer-ubuntu-latest-${version}.deb";
    hash = "sha256-NHl4gVq3RlqwEONEWJgLPCLsIlxrlvK2r97fHFhahxM=";
  };

  nativeBuildInputs = [
    dpkg
    wrapGAppsHook3
  ];

  buildInputs = [
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

  dontBuild = true;
  dontConfigure = true;
  dontWrapGApps = true;

  unpackPhase = ''
    runHook preUnpack

    dpkg-deb --fsys-tarfile $src | tar -x --no-same-owner

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib,share}
    mkdir -p $out/share/{applications,icons/hicolor/256x256/apps}
    cp -a usr/lib/chainner/. $out/lib/chainner
    cp usr/share/applications/chainner.desktop $out/share/applications/
    cp usr/share/pixmaps/chainner.png $out/share/icons/hicolor/256x256/apps/chainner.png

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper $out/lib/chainner/chainner $out/bin/chainner \
      ''${gappsWrapperArgs[@]} \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs} \
      --suffix LD_LIBRARY_PATH : /run/opengl-driver/lib \
      --suffix LD_LIBRARY_PATH : $out/lib/chainner
  '';

  meta = with lib; {
    description = "Node-based image processing GUI for AI upscaling and image workflows";
    homepage = "https://chainner.app/";
    license = licenses.gpl3Only;
    platforms = ["x86_64-linux"];
    mainProgram = "chainner";
    sourceProvenance = with sourceTypes; [binaryNativeCode];
  };
}
