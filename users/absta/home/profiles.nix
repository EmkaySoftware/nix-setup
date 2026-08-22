{ config, pkgs, ... }:

{
  imports = [
    ../../../profiles/hyprland.nix
    ../../../profiles/git.nix
  ];
}
