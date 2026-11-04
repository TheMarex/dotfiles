typeset -U path

path+=("$HOME/.atuin/bin" "$HOME/.starship/bin" "$HOME/.local/bin")

export EDITOR=nvim

# Vim mode
bindkey -v

# Fix the delete key
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" delete-char
bindkey -M vicmd "^[[3~" delete-char
bindkey -M viins "^[[3~" delete-char

# Auto-complete
autoload -Uz compinit
compinit

(( $+commands[starship] )) && eval "$(starship init zsh)"
(( $+commands[atuin] ))    && eval "$(atuin init zsh)"
(( $+commands[direnv] ))   && eval "$(direnv hook zsh)"

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zshconfig="nvim ~/.zshrc"
alias vim=nvim
alias grep="grep --color=auto"

function hcloud_token() {
  alias hcloud="HCLOUD_TOKEN=$(pass internal/hetzner_api) hcloud"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && path=("$PYENV_ROOT/bin" $path)
(( $+commands[pyenv] )) && eval "$(pyenv init -)"

case "$OSTYPE" in
  darwin*) [[ -r ~/.zshrc.macos ]] && source ~/.zshrc.macos ;;
  linux*)  [[ -r ~/.zshrc.linux ]] && source ~/.zshrc.linux ;;
esac

[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
