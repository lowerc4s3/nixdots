{
  flake.modules.nixos.discord = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (discord.override {
        withVencord = true;
      })
    ];
  };
}
