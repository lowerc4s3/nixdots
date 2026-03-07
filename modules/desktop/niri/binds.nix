{
  flake.modules.homeManager.desktop-niri = {
    lib,
    config,
    pkgs,
    ...
  }: {
    programs.niri.settings.binds = let
      inherit (lib) range nameValuePair listToAttrs mkIf mkMerge getExe;
      mkWorkspaceBinds = prefix: action:
        range 1 9
        |> map (num: nameValuePair "${prefix}+${toString num}" {action.${action} = num;})
        |> listToAttrs;
    in
      mkMerge [
        {
          # TODO: spawn default apps
          "Mod+Return".action.spawn = "foot";
          "Mod+B".action.spawn = "librewolf";

          "Mod+Shift+E".action.quit = [];

          "Mod+Tab" = {
            action.toggle-overview = [];
            repeat = false;
          };

          "Mod+W" = {
            action.close-window = [];
            repeat = false;
          };
          "Mod+Q" = {
            action.spawn-sh = "kill -9 $(niri msg --json focused-window | ${getExe pkgs.jq} '.id')";
            repeat = false;
          };
          "Mod+F".action.maximize-column = [];
          "Mod+Shift+F".action.fullscreen-window = [];

          "Mod+R".action.switch-preset-column-width = [];
          "Mod+Shift+R".action.expand-column-to-available-width = [];

          "Mod+T".action.toggle-column-tabbed-display = [];

          "Mod+H".action.focus-column-left = [];
          "Mod+J".action.focus-window-or-workspace-down = [];
          "Mod+K".action.focus-window-or-workspace-up = [];
          "Mod+L".action.focus-column-right = [];

          "Mod+Shift+H".action.move-column-left = [];
          "Mod+Shift+J".action.move-window-down-or-to-workspace-down = [];
          "Mod+Shift+K".action.move-window-up-or-to-workspace-up = [];
          "Mod+Shift+L".action.move-column-right = [];

          "Mod+Shift+Comma".action.consume-or-expel-window-left = [];
          "Mod+Shift+Period".action.consume-or-expel-window-right = [];

          "Mod+V".action.toggle-window-floating = [];
          "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];

          "Print".action.screenshot = [];
          "Shift+Print".action.screenshot-screen = {write-to-disk = false;};
          "Mod+Print".action.screenshot-window = {write-to-disk = false;};

          "Mod+WheelScrollDown".action.focus-column-right = [];
          "Mod+WheelScrollUp".action.focus-column-left = [];
          "Mod+Shift+WheelScrollDown".action.focus-workspace-down = [];
          "Mod+Shift+WheelScrollUp".action.focus-workspace-up = [];

          "XF86AudioRaiseVolume" = {
            action.spawn = ["wpctl" "set-volume" "-l" "1" "@DEFAULT_AUDIO_SINK@" "5%+"];
            allow-when-locked = true;
          };
          "XF86AudioLowerVolume" = {
            action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
            allow-when-locked = true;
          };
          "XF86AudioMute" = {
            action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
            allow-when-locked = true;
          };
        }
        (mkWorkspaceBinds "Mod" "focus-workspace")
        (mkWorkspaceBinds "Mod+Ctrl" "move-column-to-workspace")
        (mkWorkspaceBinds "Mod+Shift" "move-window-to-workspace")
        (mkIf config.programs.vicinae.enable {
          "Alt+Space" = {
            action.spawn = ["vicinae" "toggle"];
            repeat = false;
          };
        })
      ];
  };
}
