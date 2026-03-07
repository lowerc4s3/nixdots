{
  flake.modules.nixos.apps-social = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (discord.override {
        withVencord = true;
      })
    ];
  };
}
