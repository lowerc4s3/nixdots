{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    psmisc
    file
    git

    # needed for neovim
    tree-sitter
    gcc
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
