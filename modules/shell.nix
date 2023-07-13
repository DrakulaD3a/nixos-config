{ pkgs, proj_root, ... }:

{
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile "${proj_root.config.path}/tmux/tmux.conf";
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.atuin = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.nushell = {
    enable = true;
    shellAliases = {
      g = "git";
      c = "cargo";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
    initExtra = ''
      function zle-keymap-select () {
        case $KEYMAP in
          vicmd) echo -ne '\e[1 q';;
          viins|main) echo -ne '\e[5 q';;
        esac
      }
      zle -N zle-keymap-select
      zle-line-init() {
        zle -K viins
        echo -ne "\e[5 q"
      }
      zle -N zle-line-init
      echo -ne '\e[5 q'
      preexec() { echo -ne '\e[5 q' ;}
    '';

    shellAliases = {
      g = "git";
      c = "cargo";
      nix-rebuild = "sudo nixos-rebuild switch --flake $HOME/nixos-config/#laptop";
    };
  };
}
