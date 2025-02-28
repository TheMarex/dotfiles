export PATH=$PATH:/opt/google-cloud-cli/bin:$HOME/.atuin/bin:$HOME/.starship/bin

# VIM Mode
bindkey -v

# Fix the delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey -M vicmd "^[[3~" delete-char
bindkey -M viins "^[[3~" delete-char

eval "$(starship init zsh)"

eval "$(atuin init zsh)"

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zshconfig="nvim ~/.zshrc"
alias vim=nvim
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias hcloud="HCLOUD_TOKEN=$(pass internal/hetzner_api) hcloud"

export EDITOR=nvim
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
which pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
