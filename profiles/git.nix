{ config, pkgs, ...}: {

  profiles.git.active = true;  

  imports = [
    ../features/vcs/git.nix
  ];
}
