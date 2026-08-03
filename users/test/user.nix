{ config, pkgs, ... }:

{
  users.users.test = {
    isNormalUser = true;
    description = "Default user";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}