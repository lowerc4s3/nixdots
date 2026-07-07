{
  flake.aspects.cli-starship = {
    homeManager = {lib, ...}: let
      inherit (lib) concatStrings join mapAttrs filterAttrs;
      inherit (builtins) isBool attrValues;

      mkStyle = args: let
        isSet = param: value: value != null && !(isBool value && !value);
        fmt = param: value:
          if isBool value
          then toString param
          else "${param}:${value}";
      in
        args
        |> filterAttrs isSet
        |> mapAttrs fmt
        |> attrValues
        |> join " ";

      mkFg = fg:
        mkStyle {
          bg = "black";
          inherit fg;
        };
    in {
      stylix.targets.starship.colors.enable = false;
      programs.starship = {
        enable = true;
        settings = {
          add_newline = false;
          format = concatStrings [
            "$directory"
            "$character"
          ];
          right_format = concatStrings [
            "$git_branch"
            "$git_status"
            "$nix_shell"
            "$status"
          ];

          status = {
            disabled = false;
            format = "[ $symbol $status( $signal_name) ]($style)";
            style = mkStyle {
              bg = "red";
              fg = "bold black";
            };
            pipestatus = true;
            pipestatus_separator = "";
            pipestatus_format = "[ ($pipestatus| )$symbol $status( $signal_name) ]($style)";
            pipestatus_segment_format = "[$status ]($style)";
            symbol = "󰅖";
            not_executable_symbol = "";
            not_found_symbol = "";
            sigint_symbol = "";
            signal_symbol = "";
          };

          directory = {
            format = "[( $read_only) $path ]($style)";
            style = mkStyle {
              bg = "black";
              fg = "blue";
            };
            read_only = "";
            read_only_style = mkStyle {
              bg = "bright-black";
              fg = "bright-blue";
            };
            truncation_length = 0;
            truncate_to_repo = false;
          };

          character = let
            insert = "λ";
            normal = "@";
            visual = "V";
            replace = "R";
            style = bg:
              mkStyle {
                inherit bg;
                fg = "black";
              };
          in {
            success_symbol = "[ ${insert} ](${style "green"})";
            error_symbol = "[ ${insert} ](${style "red"})";
            vimcmd_symbol = "[ ${normal} ](${style "green"})";
            vimcmd_visual_symbol = "[ ${visual} ](${style "purple"})";
            vimcmd_replace_symbol = " [ ${replace} ](${style "red"})";
            vimcmd_replace_one_symbol = " [ ${replace} ](${style "red"})";
          };

          git_branch = {
            format = "([ on ](${mkFg "white"})[$symbol$branch ]($style))";
            symbol = "";
            style = mkFg "bright-blue";
          };

          git_status = let
            withCount = icon: "(${icon}$count)";
            mkStatusMod = status: fg: "[\$${status}](${mkFg fg})";
            fmt = join "" [
              (mkStatusMod "conflicted" "red")
              (mkStatusMod "staged" "green")
              (mkStatusMod "renamed" "purple")
              (mkStatusMod "deleted" "bright-red")
              (mkStatusMod "modified" "yellow")
              (mkStatusMod "untracked" "bright-blue")
              (mkStatusMod "ahead" "green")
              (mkStatusMod "behind" "yellow")
              (mkStatusMod "diverged" "red")
            ];
          in {
            format = "([${fmt} ](${mkStyle {bg = "black";}}))";
            ahead = withCount "󰁝";
            behind = withCount "󰁅";
            diverged = withCount "󰹹";
            stashed = withCount "\$";
            modified = withCount "!";
            staged = withCount "+";
            deleted = withCount "󰅖";
            renamed = withCount "»";
            untracked = withCount "?";
          };

          nix_shell = {
            format = "[ $symbol( $name) ]($style)";
            style = mkStyle {
              fg = "black";
              bg = "blue";
            };
            symbol = "󱄅";
            heuristic = true;
          };
        };
      };
    };
  };
}
