# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias ls='ls -G'

# For Go Lang
if [ -x "`which go`" ]; then
	export GOROOT=`go env GOROOT`
	export GOPATH=$HOME/_go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
