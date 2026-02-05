let
  policies = {
    DontCheckDefaultBrowser = true;
    DisablePocket = true;
    DisableAppUpdate = true;
  };
  settings = {
    # okay, these params are taken from hlissner's nix config
    # Allow svgs to take on theme colors
    "svg.context-properties.content.enabled" = true;
    # Seriously. Stop popping up on every damn page. If I want it translated,
    # I know where to find gtranslate/deepl/whatever!
    "browser.translations.automaticallyPopup" = false;
    # Enable ETP for decent security (makes firefox containers and many
    # common security/privacy add-ons redundant).
    "browser.contentblocking.category" = "strict";
    "privacy.purge_trackers.enabled" = true;
    "privacy.donottrackheader.enabled" = true;
    "privacy.donottrackheader.value" = 1;
    # Enable userContent.css and userChrome.css for our theme modules
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    # Do not check if Firefox is the default browser
    "browser.shell.checkDefaultBrowser" = false;
    # Disable Activity Stream
    # https://wiki.mozilla.org/Firefox/Activity_Stream
    "browser.newtabpage.activity-stream.enabled" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    # "Looks like you haven't started Firefox in a while."
    "browser.disableResetPrompt" = true;
    # "New to Firefox? Let's get started!" tour
    "browser.onboarding.enabled" = false;
    # Reduce File IO / SSD abuse
    # Otherwise, Firefox bombards the HD with writes. Not so nice for SSDs.
    # This forces it to write every minute, rather than 15 seconds.
    "browser.sessionstore.interval" = "30000";
    # Disable telemetry
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
    # Disable health reports (basically more telemetry)
    "datareporting.healthreport.uploadEnabled" = false;
    "datareporting.healthreport.service.enabled" = false;
    "datareporting.policy.dataSubmissionEnabled" = false;
  };
in {
  flake.modules.nixos.librewolf = {pkgs, ...}: {
    # nixpkgs doesn't have librewolf options,
    # so we configure firefox and pass
    # librewolf package to use
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      inherit policies;
      inherit settings;
    };
  };

  flake.modules.homeManager.librewolf = {
    programs.librewolf = {
      enable = true;
      inherit policies;
      inherit settings;
    };
    # TODO: theme, extensions, tridactyl config
  };
}
