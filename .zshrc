# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="daveverwer"
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function vwrap() {
  if [ $1 = 'st' ]; then
    shift
    \vagrant status $@
  elif [ $1 = 'hl' ]; then
    shift
    \vagrant halt $@
  else
    \vagrant $@
  fi
}
alias vagrant=vwrap
alias v=vagrant
alias g=git

##### peco-cd #####
function pcd() {
  local dir=$(find . -type d | peco)
  cd ${dir}
}

##### peco-cp #####
function pcp() {
  local file=$(find . -type f | peco)
  local dest=$(find . -type d | peco)
  cp ${file} ${dest}
  echo "cp ${file} ${dest}"
}

##### remove-swp #####
function rmswp() {
  find ./ -name "*.swp"
  find ./ -name "*.swp" | xargs rm
}

##### add-branch #####
function gnewbranch() {
  if [ -z "$1" ]; then
    echo "Tell me new branch name!"
    return
  fi
  git fetch
  git checkout master
  git pull
  git checkout -b "$1"
  echo "Create branch \"$1\""
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export DOCKER_HOST=tcp://127.0.0.1:4243

[[ -s /Library/Ruby/Gems/2.0.0/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh ]] && source /Library/Ruby/Gems/2.0.0/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# added by travis gem
[ -f /Users/kawayama/.travis/travis.sh ] && source /Users/kawayama/.travis/travis.sh
