alias LOGOUT=logout
if [ -x /usr/bin/dircolors ]; then
	alias ls='ls --color=auto'
fi
unset ignoreeof

export EDITOR=vim

export PS1="[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]\$ "

alias grep='grep --color=auto'
alias vi='vim'

export TERM=xterm

export CFLAGS="-g -Wall -Wextra -Wno-unused "
alias vi=vim
alias sl=ls
export c=/filer/tmp2/contrib
alias tmux="TERM=xterm-256color tmux"

# This is a lifesaver. Makes sure that your configs are loaded when you sudo.
alias sudo="sudo -E"
export HISTIGNORE=ls

export PATH=$HOME/bin:$PATH
