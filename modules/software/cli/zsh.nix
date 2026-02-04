{lib, ...}: let
  inherit (lib) mkDefault;
in {
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

      shellAliases = {
        # TODO: 'o' and 'owd' platform-specific aliases
        md = "mkdir -p";
        la = mkDefault "ls -a";
        lsa = mkDefault "ls -a";
        ll = mkDefault "ls -lah";
        l = mkDefault "ls -lh";

        # enable colored `grep` output
        grep = "grep --color=auto";
      };

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
