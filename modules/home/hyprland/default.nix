{pkgs, ...}: {
  imports = [
    ./swaylock.nix
    ./waybar.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    dconf
    dunst
    swayidle
    hyprpaper
    hyprpicker
    wofi
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 16;
    };
  };

  wayland.windowManager.hyprland.enable = true;

  xdg.configFile."hypr" = {
    recursive = true;
    source = ../../../dots/hypr;
  };
}
