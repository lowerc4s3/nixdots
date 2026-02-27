{
  flake.modules.homeManager.prompt = {lib, ...}: let
    inherit (lib) concatStrings join mapAttrs filterAttrs;
    inherit (builtins) isBool attrValues;

    mkStyle = {
      fg ? null,
      bg ? null,
      bold ? false,
      underline ? false,
      dimmed ? false,
      inverted ? false,
      blink ? false,
      hidden ? false,
      strikethrough ? false,
      ...
    } @ args: let
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
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
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
        ];

        directory = {
          format = "[( $read_only) $path ]($style)";
          style = mkStyle {
            bg = "black";
            fg = "blue";
          };
          read_only = "";
          read_only_style = mkStyle {
            bg = "black";
            fg = "bright-blue";
          };
          truncation_length = 0;
          truncate_to_repo = false;
        };

        character = let
          insertSym = "λ";
          normalSym = "@";
          symStyle = fg:
            mkStyle {
              bg = "bright-black";
              inherit fg;
            };
        in {
          success_symbol = "[ ${insertSym} ](${symStyle "green"})";
          error_symbol = "[ ${insertSym} ](${symStyle "red"})";
          vimcmd_symbol = "[ ${normalSym} ](${symStyle "green"})";
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
            (mkStatusMod "renamed" "magenta")
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
}
