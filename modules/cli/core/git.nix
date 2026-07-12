{
  flake.aspects.cli-core = {
    nixos = {pkgs, ...}: {
      programs.git = {
        enable = true;
        lfs.enable = true;
      };
      environment.systemPackages = with pkgs; [
        gh
      ];
    };

    homeManager = {
      programs.git = {
        enable = true;
        lfs.enable = true;
        settings = {
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
      programs.fish.shellAbbrs = {
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

      programs.gh = {
        enable = true;
      };
    };
  };
}
