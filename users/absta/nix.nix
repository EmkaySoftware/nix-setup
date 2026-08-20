{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = "nix-command flakes";

    nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  nix.settings.auto-optimise-store = true;
}