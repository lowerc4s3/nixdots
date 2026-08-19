{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.atoms.system;
  userOpts = {
    options = {
      enable = lib.mkEnableOption "the user";
      shell = lib.mkOption {
        description = "The default user shell";
        type = with lib.types; nullOr (either shellPackage (passwdEntry path));
        default = pkgs.fish;
      };
      isAdmin = lib.mkEnableOption "" // {
        descritpion = "Whenever to add user to wheel group";
      };
    };
  };
in
{
  options.atoms.system = {
    users = lib.mkOption {
      description = "The attrset of user accounts";
      type = with lib.types; attrsOf (submodule userOpts);
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    users.users =
      cfg.users
      |> builtins.mapAttrs (
        _: cfg: {
          inherit (cfg) enable shell;
          isNormalUser = true;
          extraGroups = [ "networkmanager" ] ++ lib.optional cfg.isAdmin "wheel";
        }
      );
  };
}
