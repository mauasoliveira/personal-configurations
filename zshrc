# # Add this to the TOP of your .zshrc
# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sorin"

DISABLE_AUTO_UPDATE="true"
DISABLE_COMPFIX="true"

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# User configuration
# 
# --- /// Custom configs 
#

fpath+=~/.zsh_functions


# Home brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#
# source <(fzf --zsh)
eval "$(zoxide init zsh)"

# Custom alias
alias n="nvim "
alias t="tmux "
alias bat="batcat"
alias mkcd="mkdir -p $1 ; cd $1"
alias mkz="mkdir -p $1 ; z $1"

# Python
alias venv="source .venv/bin/activate"

# Git related alias
alias gs="git status; "
alias commit="git add . ; git commit -am "
alias update="git fetch --all ; git pull "
alias lg="lazygit "
alias main="git fetch --all ; git checkout main ; git pull"
alias mainapp="git fetch --all ; git checkout main-app ; git pull"
alias prod="git fetch --all ; git checkout production ; git pull"
alias developapp="git fetch --all ; git checkout develop-app ; git pull"
alias develop="git fetch --all ; git checkout develop ; git pull"
alias staging="git fetch --all ; git checkout staging ; git pull"


# Yarn
alias ybuild="rm -rf dist ; yarn build"
alias yinstall="rm -rf node_modules ; yarn install"
alias yb="ybuild && exit"


# Docker things
export DOCKER_HOST=unix://$(podman info --format '{{.Host.RemoteSocket.Path}}')
alias dcu="docker compose up "
alias dcd="docker compose down "
alias dce="docker compose exec -it "

# . "$HOME/.local/bin/env"

export COREPACK_ENABLE_AUTO_PIN=0
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

source ~/GOMD
source ~/CUSTOM
source ~/API_KEYS

export PATH="/home/mauricio/.local/bin:$PATH"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/cattpuccin.yml"

eval "$(starship init zsh)"
eval "$(mise activate zsh)"

# zprof
