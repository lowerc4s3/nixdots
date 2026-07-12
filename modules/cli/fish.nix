{
  flake.aspects = {aspects, ...}: {
    cli-fish = {
      includes = with aspects; [
        cli-eza
        cli-starship
      ];

      nixos = {
        stylix.targets.fish.colors.enable = false;
        programs.fish = {
          enable = true;
          useBabelfish = true;
        };
      };

      homeManager = {pkgs, ...}: {
        home.shell.enableFishIntegration = true;
        stylix.targets.fish.colors.enable = false;
        programs.fish = {
          enable = true;

          functions = {
            mkcd = /* fish */ ''mkdir -p $argv; and cd $argv[1]'';
            last_hist_item = /* fish */ ''echo $history[1]'';
          };

          shellAbbrs = {
            "!!" = {
              position = "anywhere";
              function = "last_hist_item";
            };
            md = "mkdir -p";
            la =  "ls -a";
            lsa =  "ls -a";
            ll =  "ls -lah";
            l =  "ls -lh";
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
      };
    };
  };
}
