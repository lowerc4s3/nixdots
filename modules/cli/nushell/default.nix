{
  flake.aspects.cli-nushell = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nushell
      ];
    };

    homeManager = {config, ...}: {
      home.shell.enableNushellIntegration = true;
      programs.nushell = {
        enable = true;

        envFile.text = ''
          # Returns a record of changed env variables after running a non-nushell script's contents (passed via stdin), e.g. a bash script you want to "source"
          export def capture-foreign-env [
              --shell (-s): string = /bin/sh
              # The shell to run the script in
              # (has to support '-c' argument and POSIX 'env', 'echo', 'eval' commands)
              --arguments (-a): list<string> = []
              # Additional command line arguments to pass to the foreign shell
          ] {
              let script_contents = $in;
              let env_out = with-env { SCRIPT_TO_SOURCE: $script_contents } {
                  ^$shell ...$arguments -c `
                  env
                  echo '<ENV_CAPTURE_EVAL_FENCE>'
                  eval "$SCRIPT_TO_SOURCE"
                  echo '<ENV_CAPTURE_EVAL_FENCE>'
                  env -0 -u _ -u _AST_FEATURES -u SHLVL` # Filter out known changing variables
              }
              | split row '<ENV_CAPTURE_EVAL_FENCE>'
              | {
                  before: ($in | first | str trim | lines)
                  after: ($in | last | str trim | split row (char --integer 0))
              }

              # Unfortunate Assumption:
              # No changed env var contains newlines (not cleanly parseable)
              $env_out.after
              | where { |line| $line not-in $env_out.before } # Only get changed lines
              | parse "{key}={value}"
              | transpose --header-row --as-record
              | if $in == [] { {} } else { $in }
              | reject SCRIPT_TO_SOURCE
          }

          # Workaround for https://github.com/nix-community/home-manager/issues/4313
          open ${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh | capture-foreign-env | load-env
        '';

        environmentVariables = {
          PROMPT_INDICATOR_VI_INSERT = "λ ";
          PROMPT_INDICATOR_VI_NORMAL = "@ ";
        };

        settings = {
          history = {
            file_format = "sqlite"; # provides additional context to history
            max_size = 20000;
            isolation = true; # hides new history from other open shells
          };

          show_banner = false;
          edit_mode = "vi";

          show_hints = false;
          completions = {
            algorithm = "substring";
            # TODO: fish completions
          };

          cursor_shape = {
            vi_insert = "line";
            vi_normal = "block";
          };

          error_style = "short";

          # show table footer when table would scroll the header off screen
          footer_mode = "auto";
          table = {
            mode = "single";
            index_mode = "always";
            header_on_separator = true;
          };

          # kib, mib, gib, etc
          filesize.unit = "binary";
        };
      };
    };
  };
}
