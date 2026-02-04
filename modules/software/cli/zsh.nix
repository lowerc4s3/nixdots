{lib, ...}: {
  flake.modules.nixos.zsh = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };

  flake.modules.homeManager.zsh = {config, ...}: {
    programs.zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";

      history = {
        save = 15000;
        size = 20000;
        path = "${config.xdg.dataHome}/zsh_history";
      };

      # TODO: find an idiomatic way to insert functions
      initContent = ''
        mkcd() {
          mkdir $1
          cd $1
        }
      '';

      # TODO: 'o' and 'owd' platform-specific aliases
      shellAliases = lib.mkMerge [
        {
          # general aliases
          md = "mkdir -p";
          la = lib.mkDefault "ls -a";
          lsa = lib.mkDefault "ls -a";
          ll = lib.mkDefault "ls -lah";
          l = lib.mkDefault "ls -lh";

          # enable colored `grep` output
          grep = "grep --color=auto";
        }
        (lib.mkIf config.programs.git.enable {
          # git aliases
          gl = "git log --graph --abbrev-commit --decorate --date=relative --all";
          glo = "git log --oneline --graph --abbrev-commit --decorate --date=relative --all";
          gst = "git status --short --find-renames --branch";
          gtsu = "git status --short --find-renames --branch --untracked-files";
          ga = "git add";
          gaa = "git add -A";
          gcm = "git commit -m";
          gcam = "git commit -am";
          gd = "git diff";
        })
      ];

      autocd = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion = {
        enable = true;
        strategy = ["completion"];
      };

      # TODO: try it out
      historySubstringSearch.enable = false;
    };
  };
}
