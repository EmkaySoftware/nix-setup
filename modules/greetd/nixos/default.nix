{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    # tuigreet is a TUI greeter; without this, systemd boot-log lines can
    # interleave with and garble its rendering on the tty.
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  services.dbus.enable = true;
}
