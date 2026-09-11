{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Installed by the NixOS module (modules/hyprland/nixos) instead, so
    # Hyprland isn't built/installed twice from potentially different
    # inputs. This also makes home-manager defer xdg.portal to NixOS.
    package = null;
    portalPackage = null;
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
