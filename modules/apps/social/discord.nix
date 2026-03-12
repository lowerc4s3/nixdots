{inputs, ...}: {
  flake.aspects.apps-social.homeManager = {
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
