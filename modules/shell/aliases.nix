{lib, ...}: let
  inherit (lib) mkIf mkMerge;
in {
  flake.modules.homeManager.aliases = {config, ...}: {
    home.shellAliases = mkMerge [
      {
        md = "mkdir -p";
        la = lib.mkDefault "ls -a";
        lsa = lib.mkDefault "ls -a";
        ll = lib.mkDefault "ls -lah";
        l = lib.mkDefault "ls -lh";

        # enable colored `grep` output
        grep = "grep --color=auto";
      }
      (mkIf config.programs.git.enable {
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
      })
      (mkIf config.programs.neovim.enable {
        v = "nvim";
      })
      (mkIf config.programs.neovide.enable {
        vv = "neovide";
      })
    ];
  };
}
