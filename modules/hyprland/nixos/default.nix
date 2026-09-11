{ ... }:
{
  # Session files, the xdg-portal wiring, and the cap_sys_nice wrapper
  # Hyprland needs for SCHED_RR come from this module rather than
  # home-manager's — see modules/hyprland/home, which sets package/
  # portalPackage to null to defer to the package installed here.
  programs.hyprland.enable = true;

  security.polkit.enable = true;

  # Lets wofi's app drawer (drun) find .desktop entries from packages
  # installed via home-manager's per-user profile.
  environment.pathsToLink = [ "/share/applications" ];
}
