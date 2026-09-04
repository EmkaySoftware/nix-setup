{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # TODO: Each one of these should be features...
  home.packages = with pkgs; [
    waybar
    wofi
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
}
