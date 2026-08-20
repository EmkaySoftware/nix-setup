{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Each one of these should be features...
  environment.systemPackages = with pkgs; [
    waybar
    wofi
    kitty
    swaybg
    swaylock
    swayidle
    wl-clipboard
    grim
    slurp
    polkit_gnome
    mousepad
    google-chrome
  ];

  # Enable polkit agent for privileged actions
  security.polkit.enable = true;
}