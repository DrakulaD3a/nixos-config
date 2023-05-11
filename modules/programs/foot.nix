{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Hack Nerd Font Mono:size=8";
        pad = "0x0 center";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
