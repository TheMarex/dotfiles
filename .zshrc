export PATH=$PATH:/opt/google-cloud-cli/bin

eval "$(starship init zsh)"

eval "$(atuin init zsh)"



alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zshconfig="nvim ~/.zshrc"
alias vim=nvim

export EDITOR=nvim
source /usr/share/nvm/init-nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

