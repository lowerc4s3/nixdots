{inputs, ...}: {
  flake.modules.homeManager.apps-social = {
    imports = [inputs.nixcord.homeModules.nixcord];

    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;

      config = {
        frameless = true;
        disableMinSize = true;
      };
    };
  };
}
