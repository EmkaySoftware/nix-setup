{ config, pkgs, ...}: {
  imports = [
    ../features/desktop/compositor/hyprland.nix
    ../features/desktop/greeter/greetd.nix
  ];
}