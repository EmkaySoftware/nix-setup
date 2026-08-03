{ config, pkgs, inputs, name, ... }: {

{
  networking.hostName = "${name}";
  networking.networkmanager.enable = true;
}
  