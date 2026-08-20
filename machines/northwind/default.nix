{ config, pkgs, inputs, username, system, machineName, ... }: {

  imports = [
    ./hardware.nix
    ./boot.nix
    ./network.nix
    ./audio.nix
  ];

  system.stateVersion = "26.05"; 
}
