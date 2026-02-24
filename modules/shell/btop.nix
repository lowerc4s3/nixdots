{
  flake.modules.nixos.btop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      btop
    ];
  };

  flake.modules.homeManager.btop = {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
        rounded_corners = false;
        proc_tree = true;
      };
    };
  };
}
