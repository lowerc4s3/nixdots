{
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
