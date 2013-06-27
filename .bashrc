# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias tmux="LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/tmux"
