# notes and todos

# todos
## high prio
- [ ] security enhancements (apparmor, selinux)
- [ ] globals (font size, profile image, etc)

## low prio
- [ ] starship time module
- [ ] librewolf tridactyl or qutebrowser
- [ ] use nvx modules instead of a package
- [ ] try openrgb

## software to check out
- [ ] tmux or zellij
- [ ] fish or nushell

# globals implementations
1. global constants module – define a generic module (or generate with a
   functon) with all the params defined
    - define them while creating a system (don't know how to implement)
    - define them in a separate module and import it when creating a system (less flexible)
2. options – declare options in modules and require their definition when creating a system
