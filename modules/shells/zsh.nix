{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableSyntaxHighlighting = true;
    defaultKeymap = "viins";
    autocd = true;
    history.path = "$HOME/.cache/zsh_history";
    historySubstringSearch.enable = true;
    initExtraFirst = ''
      autoload -U colors && colors
      PS1="%B[%n@%M %~]$%b "
      '';
    # Setup shell aliases
    shellAliases = {
      g = "git";
    };
  };
}
