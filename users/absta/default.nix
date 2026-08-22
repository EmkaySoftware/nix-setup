{ config, pkgs, inputs, name, system, ... }: {

  imports = [
    ./user.nix
    ./nix.nix
    ./region.nix
    ./profiles.nix
  ];
}
