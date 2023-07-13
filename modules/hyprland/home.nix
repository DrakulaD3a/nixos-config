{ config, lib, pkgs, host, proj_root, ... }:

{
  # Where to store the configuration for hyprland
  xdg.configFile."hypr/hyprland.conf".text = builtins.readFile "${proj_root.config.path}/hyprland/hyprland.conf";

  # Enable locking the device
  programs.swaylock.enable = true;
}
