{
  # NOTE: using fish greatly increases the set of autocompleted software
  flake.aspects.cli-nushell = {
    nixos = {
      programs.fish = {
        enable = true;
        generateCompletions = true;
        vendor.completions.enable = true;
      };
    };

    homeManager = {
      pkgs,
      lib,
      ...
    }: {
      home.shell.enableFishIntegration = true;
      programs.fish = {
        enable = true;
        generateCompletions = true;
      };

      programs.nushell = {
        extraConfig = ''
          let fish_completer = {|spans|
              ${lib.getExe pkgs.fish} --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
              | from tsv --flexible --noheaders --no-infer
              | rename value description
              | update value {|row|
                let value = $row.value
                let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
                if ($need_quote and ($value | path exists)) {
                  let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
                  $'"($expanded_path | str replace --all "\"" "\\\"")"'
                } else {$value}
              }
          }

          $env.config.completions.external = {
            enable: true
            max_results: 30
            completer: $fish_completer
          }
        '';
      };
    };
  };
}
