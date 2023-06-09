{ config, pkgs, proj_root, ... }:

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
  ];

  home.file.".config/nvim".source = "${proj_root.configs.path}/neovim";
}
