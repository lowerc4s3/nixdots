{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.atoms.apps.qutebrowser;
  pkgs' = import inputs.nixpkgs-qb {
    inherit (pkgs.stdenv) system;
    config.allowUnfree = true;
  };
  package = pkgs'.qutebrowser.override { enableWideVine = pkgs.config.allowUnfree; };
  inherit (lib) mkIf mkMerge;
in
{
  options.atoms.apps.qutebrowser = {
    enable = lib.mkEnableOption "qutebrowser";
  };

  config = mkIf cfg.enable (mkMerge [
    (mkIf (config.atoms.stylix.enable or false) {
      stylix.targets.qutebrowser.colors.override = {
        withHashtag = {
          base01 = "#161616";
          base03 = "#262626";
        };
      };
    })

    {
      programs.qutebrowser = {
        inherit package;
        enable = true;

        searchEngines = {
          # general
          DEFAULT = "https://duckduckgo.com/?q={}";
          g = "https://www.google.com/search?q={}";

          # nix related
          pkgs = "https://search.nixos.org/packages?channel=unstable&query={}";
          opts = "https://search.nüschtos.de/options?query={}";
          noogle = "https://noogle.dev/q/?term={}";
          nixwiki = "https://wiki.nixos.org/w/index.php?search={}";
          archwiki = "https://wiki.archlinux.org/index.php?search={}";
        };

        loadAutoconfig = true;
        settings = {
          #
          # ui
          #

          colors.webpage = {
            preferred_color_scheme = "dark";
            darkmode = {
              enabled = true;
              algorithm = "lightness-cielab";
              policy.images = "smart";
            };
          };

          fonts = {
            # use default monospace font
            default_family = lib.mkForce "monospace";
            default_size = lib.mkForce "10pt";
            tabs.selected = "11pt sans";
            tabs.unselected = "11pt sans";
          };

          scrolling.bar = "when-searching";

          statusbar = {
            widgets = [
              "keypress"
              "url"
              "scroll"
              "history"
              "search_match"
              "progress"
            ];
          };

          tabs = {
            last_close = "close";
            position = "bottom";
            select_on_remove = "prev";
            show = "multiple";
            title = {
              alignment = "center";
              format = "{audio}{relative_index} | {current_title}";
              format_pinned = "{relative_index}";
            };
            favicons.scale = 1.1;
          };

          window = {
            title_format = "{current_title} {title_sep}qb{private}";
          };

          #
          # behavior
          #

          url = {
            open_base_url = true;
          };

          input.insert_mode.auto_load = true;

          downloads.location.prompt = false;
          content = {
            blocking.method = "both";
            headers.accept_language = "ru-RU,ru,en-US,en;q=0.9";
            pdfjs = true;
            javascript.clipboard = "access";
          };

          session.lazy_restore = true;
          auto_save.session = true;

          #
          # misc
          #

          logging.level = {
            ram = "warning";
            console = "warning";
          };

          qt.args = [
            "ignore-gpu-blocklist"
            "enable-gpu-rasterization"
            "enable-accelerated-video-decode"
            "enable-quic"
            "enable-zero-copy"
          ];
        };

        extraConfig = /* python */ ''
          config.unbind(".")
          en_keys = "qwertyuiop[]asdfghjkl;'zxcvbnm,./" + 'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?'
          ru_keys = "йцукенгшщзхъфывапролджэячсмитьбю." + "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,"
          c.bindings.key_mappings.update(dict(zip(ru_keys, en_keys)))

          c.tabs.padding = {"left": 5, "right": 5, "top": 5, "bottom": 5}
          c.tabs.indicator.padding = {"bottom": 0, "left": 0, "right": 5, "top": 0}
          c.tabs.indicator.width = 2
          c.statusbar.padding = {"left": 5, "right": 5, "top": 5, "bottom": 5}
        '';
      };
    }
  ]);
}
