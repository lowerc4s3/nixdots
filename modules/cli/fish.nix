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
          };
          interactiveShellInit = /* fish */ ''
            set -g fish_key_bindings fish_hybrid_key_bindings
          '';
        };
      };
    };
  };
}
