# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="marex"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git zsh-syntax-highlighting)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/patrick/bin:/home/patrick/.cabal/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin

alias cln='urxvt -cd `pwd` &'
alias grep='grep --color=always'
alias ll='ls -g -o --human-readable --color=auto'
alias la='ls -a --color=auto'
alias py='python'
alias ipy='ipython --no-confirm-exit --no-banner'
alias vt='vim -p'
alias runs='ps -ef | grep'
alias config='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME/.dotfiles'
function umedia () {
	sudo umount "/media/$1"
}

function test_awesome () {
	Xephyr -screen 1200x800 :1 &
	sleep 1
#	DISPLAY=:1 $1 -c $2
    DISPLAY=:1 awesome
}

function clr ()
{
	ln -sf ~/.config/colors/$1 ~/.config/colors/current
	xrdb ~/.Xresources
}

export DEBFULLNAME="Patrick Niklaus"
export DEBEMAIL="patrick.niklaus@student.kit.edu"
#export TERM="rxvt-unicode"
export EDITOR="vim"
