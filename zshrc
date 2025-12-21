# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# NVM configuration

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 
# --- /// Custom configs 
#

fpath+=~/.zsh_functions


# Home brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# OPEN Jdk
# export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@11/bin:$PATH"
# export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@11/include"

#
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

