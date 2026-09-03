{ config, pkgs, ... }:

{
  imports = [
    ../../../profiles/hyprland.nix
    ../../../profiles/git.nix
    ../../../profiles/development.nix
  ];
}
