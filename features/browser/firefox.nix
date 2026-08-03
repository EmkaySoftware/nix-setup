{ config, pkgs, ...}: 
{
  programs.firefox = {
    enable = true;

    policies = {
      #Privacy.
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableAccounts = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFormHistory = true;
      DisableWebRTC = true;
      DisableRemoteImprovements = true;
      DontCheckDefaultBrowser = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      # Misc...
      PostQuantumKeyAgreementEnabled = true;
      SearchSuggestEnabled = false;

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggestions = false;
      };

      # Firefox home showed when opening a new tab or launching Firefox.
      FirefoxHome = {
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        Snippets = false;
        Locked = true;
      };

      # Where ever this adds AI into Firefox...
      GenerativeAI = {
        Enabled = false;
        ChatBot = false;
        LinkPreviews = false;
      };

      # More AI suggestion crap
      AIControls = {
        # By default, block all.
        Default = {
          Value = "blocked";
          Locked = true;
        }
      }

      # DDG as default search engine and homepage.
      SearchEngines = {
        Default = "DuckDuckGo";

        Add = [
          {
            Name = "DuckDuckGo";
            URLTemplate = "https://duckduckgo.com/?q={searchTerms}";
            Method = "GET";
            Alias = "@ddg";
          }
        ];
      };

      Homepage = {
        URL = "https://duckduckgo.com";
        Locked = false;
      };

      # Add and lock extensions.
      ExtensionSettings = {
        "*" = {
          blocked_install_message = "Please install extensions via the Nix configuration.";
          installation_mode = "blocked";
        };

        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        # PrivacyBadger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        };

        # Sponsor block
        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
      };

      Preferences = {
        # Resist fingerprinting.
        "privacy.resistFingerprinting" = {
          Value = true;
          Status = "locked";
        };

        "privacy.resistFingerprinting.pbMode" = {
          Value = true;
          Status = "locked";
        };

        "privacy.resistFingerprinting.letterboxing" = {
          Value = true;
          Status = "locked";
        };

        # Always return en-US as the locale.
        "privacy.spoof_english" = {
          Value = "2";
          Status = "locked";
        };

        # Don't allow Mozarella approved sites to have some tracking.
        "privacy.trackingprotection.allow_list.baseline.enabled" = {
          Value = "false";
          Status = "locked";
        };

        "privacy.trackingprotection.allow_list.convenience.enabled" = {
          Value = "false";
          Status = "locked";
        };

        # Disable web rtc.
        "media.peerconnection.enabled" = {
          Value = "false";
          Status = "locked";
        };


        # Disables "Firefox exited abruptly, want to restore your previous session?" thing.
        "browser.sessionstore.enabled" = {
          Value = false;
        };
      };
    }
  };
}