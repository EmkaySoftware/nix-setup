{ pkgs, ... }: {
  programs.thunar = {
    enable = true;
  };

  # Add common mounts like trashbin etc.
  services.gvfs.enable = true; 

  # Add thumbnails.
  services.tumbler.enable = true;
}
