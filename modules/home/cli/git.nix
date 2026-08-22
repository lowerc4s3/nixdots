{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.atoms.cli;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        # TODO: configure username and email globally
        user = {
          name = "lowerc4s3";
          email = "kkirill03@gmail.com";
        };
        core.pager = "less -F -R -i -+X";
        log = {
          date = "relative";
          abbrevCommit = true;
        };
        diff.renames = true;
        url = {
          "https://github.com/".insteadOf = "gh:";
          "https://gitlab.com/".insteadOf = "gl:";
          "https://codeberg.org/".insteadOf = "cb:";
        };
      };
    };

    programs.gh.enable = true;

    atoms.cli.shell.abbrs = {
      gl = "git log";
      glo = "git log --oneline";
      gst = "git status -sb";
      gtsu = "git status -sbu";
      ga = "git add";
      gaa = "git add -A";
      gcm = {
        setCursor = true;
        expansion = "git commit -m '%'";
      };
      gcam = {
        setCursor = true;
        expansion = "git commit -am '%'";
      };
      gd = "git diff";
      gds = "git diff --staged";
      grs = "git restore --staged";
    };

    home.packages = with pkgs; [
      gitu
    ];
  };
}
