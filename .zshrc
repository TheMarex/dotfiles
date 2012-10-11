# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/patrick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

alias vim='vimx'
alias urxvt='urxvt256c'
alias grep='grep --color=always'
alias ls='ls --color=auto'
alias ll='ls -g -o --human-readable --color=auto'
alias la='ls -a --color=auto'
alias py='python'
alias ipy='ipython --no-confirm-exit --no-banner'
alias vt='vim -p'
alias agi='sudo apt-get install'
alias runs='ps -ef | grep'
alias config='git --git-dir=$HOME/.config.git/'

autoload -U colors && colors
PS1="%{$fg_bold[blue]%}%n %{$fg_no_bold[white]%}%~ %{$fg_bold[black]%}#%{$reset_color%} "

precmd() {
    [[ -t 1 ]] || return
    case $TERM in
      sun-cmd) print -Pn "\e]l%~\e\\"
        ;;
      *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m : %~\a"
        ;;
    esac
}

export DEBFULLNAME="Patrick Niklaus"
export DEBEMAIL="patrick.niklaus@student.kit.edu"
export TERM="rxvt-unicode"
export EDITOR="vim"
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

