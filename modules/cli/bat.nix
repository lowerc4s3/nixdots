{
  flake.aspects.cli-bat = {
    homeManager = {pkgs, ...}: {
      programs.bat = {
        enable = true;
        config = {
          style = "numbers";
          set-terminal-title = true;
        };
        syntaxes = {
          fennel = {
            src = pkgs.fetchFromGitHub {
              owner = "gbaptista";
              repo = "sublime-text-fennel";
              rev = "212b9d5ab14412d8d1f4f9db783e201785e167d6";
              hash = "sha256-puHDk0xDvdOfNGOkuc4AqaE/fSNm5vVFqoaFkL1vXIY=";
            };
            file = "Fennel.sublime-syntax";
          };
        };
      };
    };
  };
}
