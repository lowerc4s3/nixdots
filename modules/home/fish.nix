{
  pkgs,
  lib,
  flake,
  ...
}:
{
  stylix.targets.fish.colors.enable = false;
  programs.fish = {
    enable = true;

    functions = {
      mkcd = "mkdir -p $argv; and cd $argv[1]";
      last_hist_item = "echo $history[1]";
    };

    shellAbbrs = {
      "!!" = {
        position = "anywhere";
        function = "last_hist_item";
      };
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

    plugins = with pkgs.fishPlugins; [
      {
        name = "tide";
        src = tide;
      }
    ];
  };

  home = {
    shell.enableFishIntegration = true;
    packages = with pkgs; [
      fishPlugins.tide
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
