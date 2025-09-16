# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/charnsak/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

ZSH_DISABLE_COMPFIX=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
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

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zshl"
################# common ##################
alias แสำฟพ="clear"
alias cls="clear"
alias clera="clear"
alias yarn="npm"
alias bpi="cd ~/go/src/git.linecorp.com/LINE-Thailand/bot-plugins/"
alias cdd="cd ~/Desktop"
alias cdf="cd ~/Projects/frontend"
alias cdp="cd ~/Projects"
alias cdb="cd ~/Projects/backend"
alias bpp="cd ~/Projects/backend/bot-plugins"
################# git #####################

alias gbdall="git branch | grep -v "develop" | grep -v "master" | grep -v "main" | xargs git branch -D"
alias gpu='git push -u origin "$(git rev-parse --abbrev-ref HEAD)"'
###########################################

################# docker ##################
alias dsall="docker stop $(docker ps -q)"
###########################################

############ kubectl alias ############
alias k="kubectl"
alias kgc="kubectl config current-context"
alias kgs="kubectl get service"
alias kgp="kubectl get pods"
alias kgd="kubectl get deployment"
alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"
alias kcu="kubectl config use-context"
alias kcl="kubectl config get-contexts"
#######################################
alias fixgolint="brew uninstall golangci/tap/golangci-lint && brew install golangci/tap/golangci-lint"
alias removepycache="find . -type d -name __pycache__ -exec rm -rf {} \;"
alias gvmuse="gvm use go$(sed -nr 's/go ([0-9]+\.?[0-9]*)/\1/p' go.mod)"
alias gmt="go mod tidy"
alias python="python3"
#######################################

#!/usr/bin/env zsh


function change_node_version() {
	if [[ -f ".nvmrc" ]]; then
		nvm use
	fi
}

function change_go_version() {
	if [ -f "go.mod" ]; then
    local version=(`sed -nr 's/go ([0-9]+\.?[0-9]*)/\1/p' go.mod`)
    gvm use go${version}
  fi
}

autoload -Uz add-zsh-hook # load add-zsh-hook with zsh (-z) and suppress aliases (-U)

add-zsh-hook chpwd change_node_version
add-zsh-hook chpwd change_go_version

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[[ -s "/Users/charnsak/.gvm/scripts/gvm" ]] && source "/Users/charnsak/.gvm/scripts/gvm"

export GOPATH=$HOME/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export PATH="/Users/charnsak/.gvm/pkgsets/go1.20/global/bin/mockgen/$PATH"
export PATH="$PATH:/Users/charnsak/Library/Application Support/Coursier/bin"
export PATH="$PATH:~/.bun/bin"
export GOPRIVATE=git.linecorp.com,git-dev.linecorp.com
export CARGOPATH=$HOME/.cargo/bin
export PATH="$CARGOPATH:$PATH"
source virtualenvwrapper.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# source ~/verda.sh
. "/Users/charnsak/.deno/env"
# bun completions
[ -s "/Users/charnsak/.bun/_bun" ] && source "/Users/charnsak/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
