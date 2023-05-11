{ config, lib, pkgs, user, ... }:

{
  # Window manager
  imports = [(import ../../modules/hyprland/home.nix)] ++
            (import ../../modules/editors) ++
            (import ../../modules/shells) ++
            (import ../../modules/programs);

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
}
