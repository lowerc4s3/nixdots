{
  flake.modules.nixos.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };

  flake.modules.homeManager.git = {config, ...}: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings.user = {
        name = "lowerc4s3";
        email = "kkirill03@gmail.com";
      };
    };
    home.shellAliases = {
      gl = "git log --graph --abbrev-commit --decorate --date=relative --all";
      glo = "git log --oneline --graph --abbrev-commit --decorate --date=relative --all";
      gst = "git status --short --find-renames --branch";
      gtsu = "git status --short --find-renames --branch --untracked-files";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      gcam = "git commit -am";
      gd = "git diff";
      gds = "git diff --staged";
    };
  };
}
