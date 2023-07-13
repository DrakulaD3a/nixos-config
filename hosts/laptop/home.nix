{ config, lib, pkgs, user, ... }:

{
  # Window manager
  imports = [ (import ../../modules/hyprland/home.nix) ] ++
    (import ../../modules);

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
      rustup
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "tokyo-night";
      package = pkgs.tokyo-night-gtk;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "gtk2";
  };
}
