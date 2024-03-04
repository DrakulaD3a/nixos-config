{pkgs, ...}: {
  home.packages = with pkgs; [
    sqlite
    ripgrep
    fd
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    recursive = true;
    source = ../../dots/nvim;
  };
}
