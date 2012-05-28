alias LOGOUT=logout
if [ -x /usr/bin/dircolors ]; then
	alias ls='ls --color=auto'
fi
unset ignoreeof

export EDITOR=vim


function EXT_COL () { echo -ne "\[\033[38;5;$1m\]"; }

NC='\e[m'   # reset colors

USERCOL=`EXT_COL 25`
ATCOL=`EXT_COL 26`
HOSTCOL=`EXT_COL 29`
PATHCOL=`EXT_COL 115`
BRANCHCOL=`EXT_COL 216`
RETURNCOL=`EXT_COL 9`
TIMECOL=`EXT_COL 242`

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_dirty {
        status=`git status 2> /dev/null`
        dirty=`echo -n "${status}" 2> /dev/null | grep -q "modified:" 2> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep -q "Untracked files" 2> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep -q "Your branch is ahead of" 2> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep -q "new file:" 2> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep -q "renamed:" 2> /dev/null; echo "$?"`
        bits=''
        if [ "${dirty}" == "0" ]; then
                bits="${bits}⚡"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="${bits}?"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="${bits}+"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="${bits}*"
        fi
        if [ "${renamed}" == "0" ]; then
                bits="${bits}>"
        fi
        echo "${bits}"
}

nonzero_return() {
   RETVAL=$?
   [ $RETVAL -eq 1 ] && echo " ⏎ $RETVAL "
}

export PS1="[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]] $BRANCHCOL\`parse_git_branch\`\`parse_git_dirty\`$NC \$ "


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

export PATH=$HOME/bin:/usr/sbin:/sbin:$PATH
