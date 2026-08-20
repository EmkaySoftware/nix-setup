{ pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  
  home.packages = with pkgs; [
    kitty
  ];

  wayland.windowManager.hyprland = {
    enable = true;
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
	"$mod, LEFT, movefocus, l"
	"$mod, RIGHT, movefocus, r"
	"$mod, UP, movefocus, u"
	"$mod, DOWN, movefocus, d"

	"$mod, CTRL, LEFT, movewindow, l"
	"$mod, CTRL, RIGHT, movewindow, r"
	"$mod, CTRL, UP, movewindow, u"
	"$mod, CTRL, DOWN, movewindow, d"

	"$mod, SHIFT, LEFT, swapwindow, l"
	"$mod, SHIFT, RIGHT, swapwindow, r"
	"$mod, SHIFT, UP, swapwindow, u"
	"$mod, SHIFT, DOWN, swapwindow, d"

	# Window layout controls
      ];

      exec-once = [
	"waybar"
      ];
    };
  };
}
