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
        ];

        directory = {
          format = "[( $read_only) $path ]($style)";
          style = mkStyle {
            bg = "black";
            fg = "bright-blue";
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

        git_status = {
          format = "([ $all_status$ahead_behind ]($style))";
          style = mkStyle {
            bg = "bright-black";
            fg = "bright-green";
          };
          ahead = " ";
          behind = " ";
          diverged = " ";
          deleted = " ";
        };

        git_branch = {
          format = "([ on $symbol$branch ]($style))";
          symbol = "";
          style = mkStyle {
            bg = "bright-black";
            fg = "bright-green";
          };
        };
      };
    };
  };
}
