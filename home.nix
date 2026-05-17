{ pkgs, userData, agenix, ... }:
let
  user = "zeta";
  homeDir = "/home/${user}";
in
{
  home.username = user;
  home.homeDirectory = homeDir;
  
  #Install default packages that aren't nix modules.
  home.packages = with pkgs; [
    neofetch
    xfce.mousepad
    krita
    swayimg
    gnupg
    vscodium
  ];

  # Manage file associations
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = [ "mousepad.desktop" ];
        "text/x-nix" = [ "lapce.desktop" ];
        "image/jpeg" = [ "swayimg.desktop" "krita.desktop" ];
        "image/png" = [ "swayimg.desktop" "krita.desktop" ];
        "image/gif" = [ "swayimg.desktop" "krita.desktop" ];
        "image/bmp" = [ "swayimg.desktop" "krita.desktop" ];
        "image/webp" = [ "swayimg.desktop" "krita.desktop" ];
      };
    };
  };

  home.stateVersion = "25.11";
}