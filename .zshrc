#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

eval "$(rbenv init -)"

# Customize to your needs...
setopt nonomatch

# git
alias git-aliases='cat ~/.zprezto/modules/git/alias.zsh | grep "alias "'
alias gst='gwS'

# ghq
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias ghb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# docker-compose
alias dcr='docker-compose run --rm'
alias dcl='docker-compose logs -f -t --tail=200'
alias dcu='docker-compose up -d --force-recreate'
alias dcp='docker-compose ps'
alias dcq='docker-compose ps -q'
alias dcd='docker-compose down'

# ssh
alias ssh-f='ssh -f -N'

# kubectl
alias kb='kubectl'
alias kbp='(){kb get pod -l app=$1 -o jsonpath="{.items[0].metadata.name}"}'
alias kbe='(){kb exec -it $(kbp $1) -- rails c}'

kba() {
  kubectl config get-contexts | sed "/^\ /d"
  kubectl auth can-i get ns >/dev/null 2>&1 && echo "(Authorized)" || echo "(Unauthorized)"
}
kbc() {
  test "$1" = "-" && kubectx - || kubectx "$(kubectx | peco)"
}
kbn() {
  test "$1" = "-" && kubens - || kubens "$(kubens | peco)"
}
