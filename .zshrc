# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nowl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey    ";5D"            emacs-backward-word
bindkey    ";3D"            emacs-backward-word
bindkey    ";5C"            emacs-forward-word
bindkey    ";3C"            emacs-forward-word
bindkey    "^[[H"           beginning-of-line
bindkey    "^[[F"           end-of-line
