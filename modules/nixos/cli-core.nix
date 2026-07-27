{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    psmisc
    file
    git
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      gcc
      tree-sitter
    ];
  };
}
