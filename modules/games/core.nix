{self, ...}: {
  flake.aspects = {aspects, ...}: {
    games-core.includes = with aspects; [
      games-gamemode
      games-mangohud
      games-steam
    ];
  };
}
