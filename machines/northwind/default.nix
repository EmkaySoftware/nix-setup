{ config, pkgs, inputs, username, system, ... }: {

  imports = [
    ./hardware.nix
    ./boot.nix
    ./network.nix
    ./audio.nix
  ];

  system.stateVersion = "25.05"; 
}