{
  rustPlatform,
  scdoc,
  lib,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage {
  pname = "oniri";
  version = "v1.3.1";

  src = fetchFromGitHub {
    owner = "Antiz96";
    repo = "oniri";
    tag = "v1.3.1";
    hash = "sha256-XQyzoQ/s6ROj+GKwpZM2rZHl9niE/6IWBcE2lgJ8KR8=";
  };
  cargoHash = "sha256-mDS5kyBYjzn31gekqrH8zm2fLzBSFDXODxjGqszoWcE=";

  nativeBuildInputs = [
    scdoc
  ];

  postBuild = ''
    scdoc < doc/man/oniri.1.scd > doc/man/oniri.1
  '';

  postInstall = ''
    install -Dm644 doc/man/oniri.1 "$out/share/man/man1/oniri.1"
    install -Dm644 res/completions/oniri.bash "$out/share/bash-completion/completions/oniri"
    install -Dm644 res/completions/oniri.zsh  "$out/share/zsh/site-functions/_oniri"
    install -Dm644 res/completions/oniri.fish "$out/share/fish/vendor_completions.d/oniri.fish"
  '';

  meta = with lib; {
    description = "Automatically maximize the only window of a niri workspace";
    homepage = "https://github.com/Antiz96/oniri";
    license = licenses.gpl3Plus;
    mainProgram = "oniri";
    platforms = platforms.linux;
  };
}
