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
          interactiveShellInit = /* fish */ ''
            set -g fish_greeting # disable greeting
          '';
        };
      };

      homeManager = {pkgs, ...}: {
        home.shell.enableFishIntegration = true;
        stylix.targets.fish.colors.enable = false;
        programs.fish = {
          enable = true;
          functions = {
            mkcd = /* fish */ ''mkdir -p $argv; and cd $argv[1]'';
            fish_multi_key_bindings = /* fish */ ''
              # set emacs bindings for insert mode
              fish_default_key_bindings -M insert

              # and vi bindings for everything else
              fish_vi_key_bindings --no-erase
            '';
          };
          interactiveShellInit = /* fish */ ''
            set -g fish_key_bindings fish_multi_key_bindings
          '';
        };
      };
    };
  };
}
