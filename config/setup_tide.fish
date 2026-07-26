# preset
tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time=No \
--lean_prompt_height='One line' --prompt_spacing=Compact --icons='Few icons' --transient=No

# general
set -U tide_prompt_pad_items true
set -U tide_left_prompt_items pwd character
set -U tide_right_prompt_items status cmd_duration git jobs nix_shell

# pwd
set -U tide_pwd_bg_color black
set -U tide_pwd_color_anchors brblue
set -U tide_pwd_color_dirs blue
set -U tide_pwd_color_truncated_dirs magenta
set -U tide_pwd_icon_unwritable '󰍁'

# character
set -U tide_character_icon 'λ '
set -U tide_character_vi_icon_default '@ '
set -U tide_character_vi_icon_replace 'R '
set -U tide_character_vi_icon_visual 'V '
set -U tide_character_color black --bold --background brgreen
set -U tide_character_color_failure black --bold --background brred

# status
set -U tide_status_bg_color green
set -U tide_status_color black
set -U tide_status_bg_color_failure red
set -U tide_status_color_failure black
set -U tide_status_icon 󰄬
set -U tide_status_icon_failure 󰅖

# duration
set -U tide_cmd_duration_bg_color yellow
set -U tide_cmd_duration_color black
set -U tide_cmd_duration_decimals 0
set -U tide_cmd_duration_threshold 3000 # ms

# git
set -U tide_git_bg_color black
set -U tide_git_bg_color_unstable black
set -U tide_git_bg_color_urgent black

# jobs
set -U tide_jobs_bg_color green
set -U tide_jobs_color black
set -U tide_jobs_icon ''

# nix
set -U tide_nix_shell_bg_color brblue
set -U tide_nix_shell_color black
set -U tide_nix_shell_icon ''
