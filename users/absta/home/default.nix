{ lib, config, pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.11";
  
  home.packages = with pkgs; [
    kitty
    osu-lazer-bin
  ];

  # Submodules of home that are profile dependent and guarded by mkIf.
  imports = [
    ../../../profiles
    ./profiles.nix
    ./hyprland.nix
    ./git.nix
  ];
}
