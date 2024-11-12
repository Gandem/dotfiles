export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'

# Left prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs status)
# Demo mode
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context custom_kube_ps1)

# context
POWERLEVEL9K_CONTEXT_FOREGROUND="254"
POWERLEVEL9K_CONTEXT_BACKGROUND="092"
POWERLEVEL9K_CONTEXT_TEMPLATE="\ueef7" # Dog

# dir
POWERLEVEL9K_DIR_BACKGROUND="161"
POWERLEVEL9K_DIR_FOREGROUND="254"

# vcs
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="173"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="076"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="076"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="254"
POWERLEVEL9K_DISABLE_GITSTATUS="true"

# Right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# ZSH history
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Ask confirmation for 'rm *'
unsetopt rm_star_silent

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker golang z fzf zsh-syntax-highlighting)

source ${ZSH}/oh-my-zsh.sh

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

################
# 1. Env vars  #
################

# Go
export GOPATH="${HOME}/go"
export CGO_CFLAGS_ALLOW="-fno-builtin-memcmp"
export CGO_CXXFLAGS_ALLOW="-fno-builtin-memcmp|-lpthread"

# GPG
export GPG_TTY=$(tty)

# AWS
# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login
# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm
export HELM_DRIVER=configmap

################
# 2. Aliases   #
################

# Asking for confirmation before deleting a file
alias cp='cp -i'
alias mv='mv -vi'
alias rm='rm -i'

# Some 'ls' aliases
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -lah'

# Aliases
alias c='clear'
alias less='less -q'
alias s='cd ..'
alias df='df -h'
alias du='du -h'

################################
# 3. Fun-ctions                #
################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

zstyle ':completion:*' matcher-list 'r:|=*'
