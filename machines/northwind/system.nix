{ config, name, pkgs, ... }:

{
  networking.hostName = "${name}";
  networking.networkmanager.enable = true;

  # Not sure where this belongs, it's host specific in terms of NVidia drivers....
  # So lets always set this to true, even though it might not need unfree software/drivers.
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}