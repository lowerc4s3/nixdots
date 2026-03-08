# notes and todos

## todo
- [ ] security enhancements (apparmor, selinux)
- [x] config resturcture
- [ ] noctalia config
- [ ] stylix
- [ ] shared options declarations (font size, profile image, etc)
- [ ] option declarations for better structuring
- [ ] starship time module
- [ ] librewolf tridactyl or qutebrowser
- [ ] use nvx modules instead of a package
- [ ] try openrgb
- [ ] check facter
- [ ] tmux or zellij

## structure changes
1. bases – general packages and configs wanted on every system. system can have
   only one base applied. bases are hierarchical, more featureful ones inherit
   previous bases.
    - minimal – nix config, not sure about this
    - system – system packages, networking, audio, boot, file systems
    - cli/shell – cli utils, some minimal neovim config, zsh
    - desktop – desktop specific settings (fonts, some params)
2. features – sets of packages and configs tailored for a specific usecase.
system can import multiple features.
    - app sets – social, development, gaming, general (terminal, browser), wm basic
    apps (file manager, etc)
    - desktop environments – kde, gnome, niri (with shell like noctalia, file
    manager, pdf and image viewer, etc)
3. feature cores – 
4. features (and probably bases) should be placed in the subdir named after the
   feature and import all required modules in `default.nix`
