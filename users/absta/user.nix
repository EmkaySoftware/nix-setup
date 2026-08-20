{ config, pkgs, ... }:

{
  users.users.absta = {
    isNormalUser = true;
    description = "Primary user";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}