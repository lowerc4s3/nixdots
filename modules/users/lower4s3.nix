{
  flake.modules.nixos.lowerc4s3 = {pkgs, ...}: {
    users.users.lowerc4s3 = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
}
