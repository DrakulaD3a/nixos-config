{ config, lib, pkgs, host, system, hyprland, ... }:

{
  imports = [ ../waybar.nix ];

  # Automatically open hyprland
  environment = {
    loginShellInit = ''
      if [ -z DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';

    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
    sessionVariables = with host; {
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATIONS = "1";

      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };
    systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
      wlr-randr
      swaylock
      swaybg
      foot
      imv
    ];
  };

  security.pam.services.swaylock.text = "auth include login";

  # Enabling hyprland
  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
