{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.nautilus;
  pdftoppm = lib.getExe' pkgs.poppler-utils "pdftoppm";

  # pdftoppm always appends the extension, so we need helper to remove it
  thumbnailer-helper = pkgs.writeShellScript "pdftoppm-thumbnailer-helper" ''
    exec ${pdftoppm} -png -singlefile -scale-to "$1" "$2" "''${3%.*}"
  '';

  pdftoppm-thumbnailer = pkgs.writeTextFile {
    name = "pdftoppm-thumbnailer";
    destination = "/share/thumbnailers/pdftoppm.thumbnailer";
    text = ''
      [Thumbnailer Entry]
      TryExec=${pdftoppm}
      Exec=${thumbnailer-helper} %s %i %o
      MimeType=application/pdf;application/x-pdf;image/pdf;
    '';
  };
in
{
  options.atoms.apps.nautilus = {
    enable = lib.mkEnableOption "nautilus file manager";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nautilus
      ffmpegthumbnailer
      pdftoppm-thumbnailer
    ];
    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "foot";
    };
  };
}
