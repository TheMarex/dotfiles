# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="terminalparty"

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
plugins=(git zsh-syntax-highlighting npm)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/patrick/.gem/ruby/2.2.0/bin:/home/patrick/.local/bin:/home/patrick/.cabal/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin

# powerline theme
if [[ -r ~/.local/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi

alias xmake='make -j$(nproc)'
alias cln='urxvt -cd `pwd` &'
alias grep='grep --color=always'
alias ll='ls -g -o --human-readable --color=auto'
alias la='ls -a --color=auto'
alias py='python'
alias ipy='ipython --no-confirm-exit --no-banner'
alias ipynote='ipython notebook'
alias vt='vim -p'
alias runs='ps -ef | grep'
alias config='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME/.dotfiles'
function umedia () {
	sudo umount "/media/$1"
}

function setup_ros () {
	source /opt/ros/indigo/setup.zsh
}

function setup_catkin () {
	catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
}

function clr ()
{
	ln -sf ~/.config/colors/$1 ~/.config/colors/current
	xrdb ~/.Xresources
}

source "$(npm root -g)/mapbox-cli/mapbox.sh"

export DEBFULLNAME="Patrick Niklaus"
export DEBEMAIL="patrick.niklaus@student.kit.edu"
#export TERM="rxvt-unicode"
export EDITOR="vim"
