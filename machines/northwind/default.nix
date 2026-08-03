{ config, pkgs, inputs, name, system, ... }: {

  imports = [
    ./hardware.nix
    ./boot.nix
    ./network.nix
    ./audio.nix
  ];
}