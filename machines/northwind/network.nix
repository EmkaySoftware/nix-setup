{ config, pkgs, inputs, machineName, ... }: 
{
  networking.hostName = "${machineName}";
  networking.networkmanager.enable = true;
}
  
