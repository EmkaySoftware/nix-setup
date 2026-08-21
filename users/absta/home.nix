{ pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  
  home.packages = with pkgs; [
    kitty
    osu-lazer-bin
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
      "$mod" = "SUPER";
      
      monitor = [
        ",preferred,auto,1"
      ];
    
      input = {
	left_handed = true;
      };

      bind = [
	# App commands
	"$mod, T, exec, kitty"
	"$mod, Q, killactive"
	"$mod, D, exec, wofi --show drun"

	# Window controls
	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"

	"$mod CTRL, left, movewindow, l"
	"$mod CTRL, right, movewindow, r"
	"$mod CTRL, up, movewindow, u"
	"$mod CTRL, down, movewindow, d"

	"$mod SHIFT, left, swapwindow, l"
	"$mod SHIFT, right, swapwindow, r"
	"$mod SHIFT, up, swapwindow, u"
	"$mod SHIFT, down, swapwindow, d"

	# Window layout controls
      ];

      exec-once = [
	"waybar"
      ];
    };
  };
}
