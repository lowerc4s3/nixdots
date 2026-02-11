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

      initLua = ''
        require("full-border"):setup { type = ui.Border.PLAIN }

        require("relative-motions"):setup {
          show_numbers = "relative_absolute",
          show_motion = true
        }

        -- Show symlink in status bar
        Status:children_add(function(self)
          local h = self._current.hovered
          if h and h.link_to then
            return " -> " .. tostring(h.link_to)
          else
            return ""
          end
        end, 3300, Status.LEFT)

        -- Show username@hostname in header
        Header:children_add(function()
          if ya.target_family() ~= "unix" then
            return ""
          end
          return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
        end, 500, Header.LEFT)
      '';

      settings = {
        mgr = {
          ratio = [1 3 4];
          linemode = "size";
        };
      };

      # remove rounded corners
      theme = let
        separators = open: close: {inherit open close;};
      in {
        indicator.padding = separators "█" "█";
        status = {
          sep_left = separators "" "";
          sep_right = separators "" "";
        };
        tabs = {
          sep_inner = separators "" "";
          sep_outer = separators "" "";
        };
      };


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
      ] ++ builtins.map (digit: rel-step digit) (lib.range 1 9);
    };
  };
}
