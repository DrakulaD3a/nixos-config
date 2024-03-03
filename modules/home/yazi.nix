{
  programs.yazi.enable = true;

  xdg.configFile."yazi" = {
    recursive = true;
    source = ../../dots/yazi;
  };
}
