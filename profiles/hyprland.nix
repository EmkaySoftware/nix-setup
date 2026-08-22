{ config, pkgs, ...}: {
  
  profiles.hyprland.active = true;

  imports = [
    ../features/desktop/compositor/hyprland.nix
    ../features/desktop/greeter/greetd.nix
  ];
}
