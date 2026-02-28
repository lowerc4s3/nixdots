{
  flake.modules.nixos.librewolf = {pkgs, ...}: {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
    };
  };

  flake.modules.homeManager.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      languagePacks = ["ru"];
      profiles.default = {
        settings = {
          # disable some librewolf privacy options
          # to make web a bit more usable
          "webgl.disabled" = false;
          "privacy.resistFingerprinting" = false;
          "privacy.clearOnShutdown.cache" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown_v2.cache" = false;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;

          "browser.toolbars.bookmarks.visibility" = "never";

          # restore tabs on startup
          "browser.sessionstore.enabled" = true;
          "browser.startup.page" = 3;

          # remember passwords
          "signon.rememberSignons" = true;

          # enable search suggestions
          "browser.search.suggest.enabled" = true;
          "browser.urlbar.suggest.searches" = true;

          # use russian locale and ui lang
          "intl.regional_prefs.use_os_locales" = true;

          # allow svgs to take on theme colors
          "svg.context-properties.content.enabled" = true;

          # disable page translation
          "browser.translations.automaticallyPopup" = false;

          # enable ETP for decent security (makes firefox containers and many
          # common security/privacy add-ons redundant).
          "browser.contentblocking.category" = "strict";
          "privacy.purge_trackers.enabled" = true;

          # enable userChrome.css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          # "Looks like you haven't started Firefox in a while."
          "browser.disableResetPrompt" = true;
          # "New to Firefox? Let's get started!" tour
          "browser.onboarding.enabled" = false;

          # reduce file IO / SSD abuse
          # otherwise, firefox bombards the HD with writes. not so nice for SSDs.
          # this forces it to write every minute, rather than 15 seconds.
          "browser.sessionstore.interval" = "30000";

          # disable telemetry
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "experiments.supported" = false;
          "experiments.enabled" = false;
          "experiments.manifest.uri" = "";
          "browser.ping-centre.telemetry" = false;
          # disable health reports (basically more telemetry)
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
        };
      };
    };
  };
}
