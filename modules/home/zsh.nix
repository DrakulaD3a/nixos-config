{pkgs, ...}: {
  home.packages = with pkgs; [
    eza
    bat
  ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = ["--disable-up-arrow"];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux.enable = true;
  xdg.configFile."tmux/tmux.conf".source = ../../dots/tmux.conf;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "viins";

    shellAliases = {
      g = "git";
      c = "cargo";
      ls = "eza";
      cat = "bat";

      tn = "tmux new";
      ta = "tmux attach";
      ts = "tmux-sessionizer";
    };

    initExtra = ''
      function ya() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
          fi
          rm -f -- "$tmp"
      }
    '';
  };
}
