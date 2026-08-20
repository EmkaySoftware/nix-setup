{ config, pkgs, inputs, username, ... }: 
{
  networking.hostName = "${username}";
  networking.networkmanager.enable = true;
}
  