{
  # completion options (implementation is again from zimfw/completion)
  flake.modules.homeManager.zsh-completion = {
    programs.zsh.completionInit = ''
      autoload -Uz compinit && compinit

      #
      # Zsh options
      #
      local glob_case_sensitivity completion_case_sensitivity
      glob_case_sensitivity=insensitive
      completion_case_sensitivity=insensitive

      # Move cursor to end of word if a full completion is inserted.
      setopt ALWAYS_TO_END

      # Completion is done from both ends of the cursor.
      setopt COMPLETE_IN_WORD

      if [[ ''${glob_case_sensitivity} == sensitive ]]; then
        setopt CASE_GLOB
      else
        setopt NO_CASE_GLOB
      fi

      # Don't beep on ambiguous completions.
      setopt NO_LIST_BEEP

      #
      # Completion module options
      #

      # Enable caching
      zstyle ':completion::complete:*' use-cache on

      # Group matches and describe.
      zstyle ':completion:*' menu select
      zstyle ':completion:*:matches' group yes
      zstyle ':completion:*:options' description yes
      zstyle ':completion:*:options' auto-description '%d'
      zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
      zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
      zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
      zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
      zstyle ':completion:*' group-name ""
      zstyle ':completion:*' verbose yes
      if [[ ''${completion_case_sensitivity} == sensitive ]]; then
        zstyle ':completion:*' matcher-list "" '+r:|[._-]=* r:|=*' '+l:|=*'
      else
        # This is actually "smart" case sensitivity. Case insensitive is 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
        # which is broken in Zsh 5.9. See https://www.zsh.org/mla/workers/2022/msg01229.html
        zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+r:|[._-]=* r:|=*' '+l:|=*'
      fi

      # Insert a TAB character instead of performing completion when left buffer is empty.
      zstyle ':completion:*' insert-tab false

      # Ignore useless commands and functions
      zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
      # Array completion element sorting.
      zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

      # Directories
      if (( ''${+LS_COLORS} )); then
        zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
      else
        # Use same LS_COLORS definition from utility module, in case it was not set
        zstyle ':completion:*:default' list-colors ''${(s.:.):-di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43}
      fi
      zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
      zstyle ':completion:*' squeeze-slashes true

      # History
      zstyle ':completion:*:history-words' stop yes
      zstyle ':completion:*:history-words' remove-all-dups yes
      zstyle ':completion:*:history-words' list false
      zstyle ':completion:*:history-words' menu yes

      # Don't complete uninteresting users...
      zstyle ':completion:*:*:*:users' ignored-patterns \
        '_*' adm amanda apache avahi beaglidx bin cacti canna clamav daemon dbus \
        distcache dovecot fax ftp games gdm gkrellmd gopher hacluster haldaemon \
        halt hsqldb ident junkbust ldap lp mail mailman mailnull mldonkey mysql \
        nagios named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd rpc rpcuser \
        rpm shutdown squid sshd sync uucp vcsa xfs

      # ... unless we really want to.
      zstyle ':completion:*' single-ignored show

      # Ignore multiple entries.
      zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
      zstyle ':completion:*:rm:*' file-patterns '*:all-files'

      # Man
      zstyle ':completion:*:manuals' separate-sections true
      zstyle ':completion:*:manuals.(^1*)' insert-sections true

      unset glob_case_sensitivity completion_case_sensitivity
    '';
  };
}
