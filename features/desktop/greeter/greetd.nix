{ config, pkgs, ...}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd Hyprland";
        user = "greeter"
      };
    };
  };

  # This shouldn't live in greeter...
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";     # Electron/Chromium apps use native Wayland
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  services.dbus.enable = true;
}