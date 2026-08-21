{
  lib,
  config,
  ...
}:
let
  cfg = config.atoms.cli;
in
{
  imports = [
    ./fish.nix
  ];

  options.atoms.cli.shell = {
    abbrs = lib.mkOption {
      description = ''
        The list of shell abbreviations which are configured
        on supported shells like fish. On shells without abbrs like zsh
        they're are added as aliases instead without advanced abbreviations
      '';
      type = with lib.types; attrsOf (either str attrs);
      default = { };
    };

    aliases = lib.mkOption {
      description = "The list of shell aliases";
      type = with lib.types; attrsOf str;
      default = { };
    };
  };

  config =
    let
      simpleAbrrs = lib.filterAttrs (_: abbr: (builtins.typeOf abbr) == "string") cfg.shell.abbrs;
    in
    {
      programs.zsh.shellAliases = simpleAbrrs ++ cfg.shells.aliases;
      programs.fish = {
        shellAbbrs = cfg.shell.abbrs;
        shellAliases = cfg.shell.aliases;
      };
    };
}
