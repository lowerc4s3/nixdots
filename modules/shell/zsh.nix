{
  lib,
  self,
  ...
}: {
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

  # multiple dot parent dir expansion
  # (implementation is the same as in zimfw/input)
  flake.modules.homeManager.zsh-dot-expand = {
    programs.zsh = {
      siteFunctions = {
        double-dot-expand = ''
          # Expand .. at the beginning, after space, or after any of ! " & ' / ; < > |
          if [[ ''${LBUFFER} == (|*[[:space:]!\"\&\'/\;\<\>|]).. && -z ''${RBUFFER} ]]; then
            LBUFFER+=/..
          else
            LBUFFER+=.
          fi
        '';
        double-dot-contract = ''
          if [[ ''${LBUFFER} == *../.. && -z ''${RBUFFER} ]] LBUFFER=''${LBUFFER::-2}
          zle backward-delete-char
        '';
      };

      initContent = ''
        zle -N double-dot-expand
        bindkey . double-dot-expand
        bindkey -M isearch . self-insert
      '';

      # disabled atm, need to figure out character handling
      # zle -N double-dot-contract
      # bindkey "^?" double-dot-contract
      # bindkey -M isearch "^?" backward-delete-char
    };
  };
}
