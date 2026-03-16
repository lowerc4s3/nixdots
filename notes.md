# notes and todos

## todo
- [x] file manager (nautilus)
- [ ] nix nushell helper utility
- [ ] security enhancements (apparmor, selinux)
- [x] config resturcture
- [x] noctalia config
- [x] stylix
- [ ] shared options declarations (font size, profile image, etc)
- [ ] option declarations for better structuring
- [ ] starship time module
- [ ] librewolf tridactyl or qutebrowser
- [ ] use nvx modules instead of a package
- [ ] try openrgb
- [x] check facter
- [ ] tmux or zellij

## nix nushell helper utility (`nox` / `nux` / `nx` / idk)
subcommands:
    - sync
        - -b/--boot = nh os/darwin boot ...$args
        - -n/--now = nh os/darwin test ...$args
        - _/-bn = nh os/darwin switch ...$args
    - pkgs
        - search = nh search ...$args (structured)
        - installed = nix-store --query --requisites /run/current-system/ (structured)
    - gen
        - ls = nh os info (structured)
        - rollback = nh os rollback ...$args
    - gc = nh clean all ...$args

## github subcommands
- git slog – structured log
