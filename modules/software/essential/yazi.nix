{lib, ...}: {
  flake.modules.nixos.yazi = {
    programs.yazi.enable = true;
  };

  flake.modules.homeManager.yazi = {pkgs, ...}: {
    programs.yazi = {
      enable = true;

      plugins = with pkgs.yaziPlugins; {
        inherit smart-enter relative-motions full-border;
      };

      # cd on exit
      enableZshIntegration = true;
      shellWrapperName = "fm";

      keymap.mgr.prepend_keymap = let
        rel-step = step: let
          step-str = builtins.toString step;
        in {
          on = [step-str];
          run = "plugin relative-motions ${step-str}";
          desc = "Move in relative steps";
        };
      in [
        {
          on = ["l"];
          run = "plugin smart-enter";
          desc = "Enter the directory or open the file";
        }
      ] ++ builtins.map (digit: rel-step digit) lib.range 1 9;
    };
  };
}
