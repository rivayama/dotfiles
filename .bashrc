# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'

# For Go Lang
if [ -x "`which go 2> /dev/null`" ]; then
	export GOROOT=`go env GOROOT`
	export GOPATH=$HOME/_go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# For rbenv
if [ -x "`which rbenv 2> /dev/null`" ]; then
	eval "$(rbenv init -)"
fi

# added by travis gem
[ -f /Users/kawayama/.travis/travis.sh ] && source /Users/kawayama/.travis/travis.sh
