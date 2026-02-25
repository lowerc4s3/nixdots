{
  flake.modules.nixos.eza = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      eza
    ];
  };

  flake.modules.homeManager.eza = {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      colors = "auto";
      extraOptions = [
        "--group-directories-first"
      ];
    };
    home.shellAliases = {
      ls = "eza";
      tree = "eza --tree";
    };
  };
}
