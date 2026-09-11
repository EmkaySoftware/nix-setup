{ lib, config, pkgs, username, ... }:
let
  modLib = import ../../../modules/lib.nix { inherit lib; };
  active = import ../active-modules.nix;
  userConfig = lib.filter builtins.pathExists (map (n: ./. + "/${n}.nix") active);
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.11";

  home.packages = with pkgs; [
    kitty
    osu-lazer-bin
  ];

  imports = modLib.mkModules "home" active ++ userConfig;
}
