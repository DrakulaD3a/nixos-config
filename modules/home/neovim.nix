{ pkgs, ... }:

{
  home.packages = with pkgs;[
    sqlite
    ripgrep
    fd
  ];

  programs.neovim.enable = true;

  xdg.configFile."nvim" = {
    recursive = true;
    source = ../../dots/nvim;
  };
}
