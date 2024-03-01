{
  programs.foot = {
    enable = true;
    server.enable = true;
  };

  xdg.configFile."foot/foot.ini".source = ../../dots/foot.ini;
}
