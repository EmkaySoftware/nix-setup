{ pkgs, ... }: 
{
  # Git config and keypair are managed inside home-manager under the user's home.nix.
  programs.git.enable = true;
}
