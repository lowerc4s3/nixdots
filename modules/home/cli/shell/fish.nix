{
  lib,
  config,
  pkgs,
  flake,
  ...
}:
let
  cfg = config.atoms.cli.shell.fish;
  inherit (lib) mkIf mkMerge;
in
{
  options.atoms.cli.shell.fish = {
    enable = lib.mkEnableOption "the fish shell configuration";
  };

  config = mkIf (config.atoms.cli.enable && cfg.enable) (mkMerge [
    (mkIf (config.atoms.stylix.enable or false) {
      stylix.targets.fish.colors.enable = false;
    })

    {
      programs.fish = {
        enable = true;

        functions = {
          mkcd = "mkdir -p $argv; and cd $argv[1]";
          last_hist_item = "echo $history[1]";
        };

        shellAbbrs = {
          md = "mkdir -p";
          la = "ls -a";
          lsa = "ls -a";
          ll = "ls -lah";
          l = "ls -lh";
        };

        interactiveShellInit = /* fish */ ''
          # disable greeting
          set -g fish_greeting

          # set vim+emacs bindings
          set -g fish_key_bindings fish_hybrid_key_bindings

          # colors
          set -g fish_color_keyword blue
          set -g fish_color_option brblue
        '';
      };

      home = {
        shell.enableFishIntegration = true;
        packages = with pkgs; [
          fishPlugins.tide
          fishPlugins.puffer
        ];
        activation =
          let
            script = flake + /config/setup_tide.fish;
          in
          {
            setupTide = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              run ${lib.getExe pkgs.fish} ${script}
            '';
          };
      };
    }
  ]);
}
