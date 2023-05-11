{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    nodePackages.prettier
    nodePackages.eslint_d
    astyle
  ];

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
  home.file.".config/nvim/ftplugin".source = ./ftplugin;
}
