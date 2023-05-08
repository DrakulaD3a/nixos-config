{ config, lib, pkgs, user, ... }:

{
  # Enable home manager
  programs.home-manager.enable = true;

  # Configuring user profile
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "22.11";

    # Installing all the packages
    packages = with pkgs; [
      mpv
      firefox
      zip
      unzip
      ffmpeg
    ];
  };
}
