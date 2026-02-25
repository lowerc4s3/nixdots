{self, ...}: {
  flake.modules.nixos.zsh = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };
  };

  flake.modules.homeManager.zsh = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.modules.homeManager; [
      zsh-dot-expand
      zsh-completion
    ];

    programs.zsh = {
      enable = true;
      # you want to obey xdg...
      dotDir = "${config.xdg.configHome}/zsh";

      history = {
        save = 15000;
        size = 20000;
        # you want to obey xdg so bad...
        path = "${config.xdg.dataHome}/zsh_history";
      };

      siteFunctions = {
        mkcd = ''
          mkdir -p "$@" && cd $_
        '';
      };

      autocd = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion = {
        enable = true;
        strategy = ["completion"];
      };

      initContent = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';

      # TODO: try it out
      historySubstringSearch.enable = false;
    };
  };
}
