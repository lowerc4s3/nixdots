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

      # TODO: try it out
      historySubstringSearch.enable = false;
    };
  };
}
