{ config, pkgs, ... }:

{
  imports = [
    ../../profiles
    ../../profiles/hyprland.nix
    ../../profiles/git.nix
  ];
}
