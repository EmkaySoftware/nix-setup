{ lib, ... }:
{
  options.profiles.git.active = lib.mkEnableOption "Git profile";
  options.profiles.hyprland.active = lib.mkEnableOption "Hyprland profile";
}
