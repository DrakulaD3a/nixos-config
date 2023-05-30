{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font Mono:size=8";
        pad = "0x0 center";
        include = "/usr/share/foot/themes/tokyonight-night";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = 0.95;
      };
    };
  };
}
