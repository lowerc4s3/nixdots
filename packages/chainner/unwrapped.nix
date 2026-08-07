{
  pname,
  lib,
  stdenv,
  fetchurl,
  dpkg,
  ...
}:
stdenv.mkDerivation rec {
  inherit pname;
  version = "nightly.2026-02-23";
  src = fetchurl {
    url = "https://github.com/chaiNNer-org/chaiNNer-nightly/releases/download/2026-02-23/chaiNNer-ubuntu-latest-${version}.deb";
    hash = "sha256-NHl4gVq3RlqwEONEWJgLPCLsIlxrlvK2r97fHFhahxM=";
  };

  nativeBuildInputs = [
    dpkg
  ];

  dontBuild = true;
  dontConfigure = true;

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
    ln -s $out/lib/chainner/chainner $out/bin/chainner

    runHook postInstall
  '';

  meta = with lib; {
    description = "Node-based image processing GUI for AI upscaling and image workflows";
    homepage = "https://chainner.app/";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "chainner";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}
