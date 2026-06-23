{ config, pkgs, inputs, name, system, ... }: {

  imports = [
    ./hardware.nix
    ./system.nix

    ../../users/emkay
  ];
}