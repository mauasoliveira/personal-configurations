# Start configuration added by Zim Framework install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
# bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
# ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
# }}} End configuration added by Zim Framework install

# Created by newuser for 5.9
#

# Zoxide
eval "$(zoxide init zsh)"

# Home brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Node config
export COREPACK_ENABLE_AUTO_PIN=0
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Instead of loading mise directly, lazy load it
if command -v mise >/dev/null; then
  # Add mise to path without running hooks immediately
  eval "$(mise activate zsh --shims)"
fi

# Starship
eval "$(starship init zsh)"

export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/catppuccin.yml"

# ----------
# Aliases
# ----------
#
# Custom alias
alias n="nvim "
alias t="tmux "
alias bat="batcat"
# alias mkcd="mkdir -p $1 ; cd $1"
# alias mkz="mkdir -p $1 ; z $1"

# Python
# alias venv="source .venv/bin/activate"

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
alias yinstall="rm -rf node_modules ; yarn install --frozen-lockfile"
alias yb="ybuild && exit"
alias ydev="clear ; rm -rf .next ; yarn dev:https "
alias yu="yarn upgrade "

# Docker things
export DOCKER_HOST=unix://$(podman info --format '{{.Host.RemoteSocket.Path}}')
alias dcu="docker compose up "
alias dcd="docker compose down "
alias dce="docker compose exec -it "

export EDITOR="nvim"

export PATH="/home/mauricio/.local/bin:/usr/local/go/bin:$PATH"

source ~/GOMD
source ~/API_KEYS
