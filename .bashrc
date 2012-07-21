# Don't do anything if not running interactively.
[[ -z "$PS1" ]] && return

# Use vi as my text editor.
export EDITOR=vi

# None of this UTF8 drawing characters nonsense.
export NCURSES_NO_UTF8_ACS=1

# Keep plenty of history.
unset HISTFILESIZE
HISTSIZE=1000000

#Ctrl - D to logout.
unset ignoreeof

# Ignore duplicate commands and whitespace in history.
HISTCONTROL=ignoreboth

# Ignore ls in my history.
export HISTIGNORE=ls

# Keep the times of the commands in history.
HISTTIMEFORMAT='%F %T  '

# Don't check for mail all the time, it's irritating.
unset MAILCHECK

# Autocorrect fudged paths in cd calls.
shopt -s cdspell &>/dev/null

# Update columns and rows if window size changes.
shopt -s checkwinsize &>/dev/null

# Put multi-line commands onto one line of history.
shopt -s cmdhist &>/dev/null

# Autocorrect fudged paths during completion.
shopt -s dirspell &>/dev/null

# Include dotfiles in pattern matching.
shopt -s dotglob &>/dev/null

# Enable advanced pattern matching.
shopt -s extglob &>/dev/null

# Enable double-starring paths.
shopt -s globstar &>/dev/null

# Append rather than overwrite Bash history.
shopt -s histappend &>/dev/null

# Never beep at me.
hash setterm &>/dev/null && setterm -bfreq 0

# Turn off annoying and useless flow control keys.
hash stty &>/dev/null && stty -ixon

# Use completion, if available.
[[ -e /etc/bash_completion ]] && source /etc/bash_completion

# SSH agent setup, if available.
[[ -e "${HOME}/.ssh/agent" ]] && source "${HOME}/.ssh/agent"

# Add various paths if they exist and aren't already in here.
DIRS="${HOME}/bin
      /usr/sbin
      /sbin
      /filer/tmp2/contrib/bin"
for DIR in $DIRS; do
    if [[ -d "$DIR" ]] && [[ ":${PATH}:" != *":${DIR}:"* ]]; then
        if [[ -n "$PATH" ]]; then
            PATH="${DIR}:${PATH}"
        else
            PATH=$DIR
        fi
    fi
done

# If we're using an xterm, force 256 colors.
case "$TERM" in
    xterm*) TERM=xterm-256color;;
esac

# If we're a screen terminal within a 256 color outer, force a 256 color
# screen terminal too. This deals with a tmux race condition bug.
case "$CONTAINING_TERM" in
    *256color)
        TERM=screen-256color
        unset CONTAINING_TERM
        ;;
esac

# Figure out how many colors we have now.
hash tput && COLORS=$(tput colors)

# Save some color codes based on our colour space.
if [[ $COLORS -ge 256 ]]; then
    COLOR_ROOT='\[\e[38;5;9m\]'
    COLOR_SUDO='\[\e[38;5;11m\]'
    COLOR_USER='\[\e[38;5;10m\]'
    COLOR_NORM='\[\e[0m\]'
elif [[ $COLORS -ge 8 ]]; then
    COLOR_ROOT='\[\e[1;31m\]'
    COLOR_SUDO='\[\e[1;33m\]'
    COLOR_USER='\[\e[1;32m\]'
    COLOR_NORM='\[\e[0m\]'
else
    COLOR_ROOT=
    COLOR_SUDO=
    COLOR_USER=
    COLOR_NORM=
fi

# Reset options for ls and grep.
LS_OPTS=
GREP_OPTS=

# If we have a color terminal, we'll use color for ls and grep.
if [[ $COLORS -ge 8 ]]; then
    hash dircolors &>/dev/null && eval "$(dircolors -b)"
    if ls --help | grep -- --color &>/dev/null; then
        LS_OPTS="${LS_OPTS} --color=auto"
    fi
    if grep --help | grep -- --color &>/dev/null; then
        GREP_OPTS="${GREP_OPTS} --color=auto"
    fi
fi

# Set up more options for grep; exclude version control files.
if ls --help | grep -- --exclude &>/dev/null; then
    for PATTERN in .git .gitignore .gitmodules; do
        GREP_OPTS="${GREP_OPTS} --exclude=${PATTERN}"
    done
fi
if grep --help | grep -- --exclude-dir &>/dev/null; then
    for PATTERN in .cvs .git .hg .svn; do
        GREP_OPTS="${GREP_OPTS} --exclude-dir=${PATTERN}"
    done
fi

# Alias ls and grep with the options we've collected.
alias ls="ls ${LS_OPTS}"
alias grep="grep ${GREP_OPTS}"

# Protect innocent MySQL databases from my stupidity.
alias mysql='mysql --safe-updates'

# I always do this, and I hate slow train.
alias sl='ls'

# I actually use ed now and then. Go figure.
alias ed='ed -p:'

# Decide on color for prompt.
if [[ $EUID -eq 0 ]]; then
    COLOR_PROMPT=${COLOR_ROOT}
elif [[ -n $SUDO_USER ]]; then
    COLOR_PROMPT=${COLOR_SUDO}
else
    COLOR_PROMPT=${COLOR_USER}
fi

# Frontend to controlling prompt.
function prompt {
    case "$1" in

        # Turn complex coloured prompt on.
        on) 
            PROMPT_COMMAND='history -a'
            PS1='[\u@\h:\w]$(prompt return)$(prompt vcs)$(prompt jobs)\$'
            PS1="${COLOR_PROMPT}${PS1}${COLOR_NORM} "
            case "$TERM" in
                screen*) PS1='\[\ek\h\e\\\]'${PS1};;
                xterm*)  PS1='\[\e]0;\h\a\]'${PS1};;
            esac
            ;;

        # Revert to simple inexpensive prompt.
        off)
            PROMPT_COMMAND=
            PS1='\$ '
            ;;

        # Git prompt function.
        git)
            git branch &>/dev/null || return 1
            HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
            BRANCH="${HEAD##*/}"
            [[ -n "$(git status 2>/dev/null | \
                grep -F 'working directory clean')" ]] || STATUS="!"
            printf '(git:%s)' "${BRANCH:-unknown}${STATUS}"
            ;;

        # Mercurial prompt function.
        hg)
            hg branch &>/dev/null || return 1
            BRANCH="$(hg branch 2>/dev/null)"
            [[ -n "$(hg status 2>/dev/null)" ]] && STATUS="!"
            printf '(hg:%s)' "${BRANCH:-unknown}${STATUS}"
            ;;

        # Subversion prompt function.
        svn)
            svn info &>/dev/null || return 1
            URL="$(svn info 2>/dev/null | \
                awk -F': ' '$1 == "URL" {print $2}')"
            ROOT="$(svn info 2>/dev/null | \
                awk -F': ' '$1 == "Repository Root" {print $2}')"
            BRANCH=${URL/$ROOT}
            BRANCH=${BRANCH#/}
            BRANCH=${BRANCH#branches/}
            BRANCH=${BRANCH%%/*}
            [[ -n "$(svn status 2>/dev/null)" ]] && STATUS="!"
            printf '(svn:%s)' "${BRANCH:-unknown}${STATUS}"
            ;;

        # VCS wrapper prompt function.
        vcs)
            prompt git || prompt svn || prompt hg
            ;;

        # Return status prompt function.
        return)
            RETURN=$? 
            [[ $RETURN -ne 0 ]] && printf '<%d>' ${RETURN}
            ;;

        # Job count prompt function.
        jobs)
            [[ -n "$(jobs)" ]] && printf '{%d}' $(jobs | sed -n '$=')
            ;;
    esac
}

#some machines dont keep my sudo.
alias sudo="sudo -E"

# A nice alias for JSON viewing
alias json="python -mjson.tool"

# Run local file if it exists.
[[ -e "${HOME}/.bashrc.local" ]] && source "${HOME}/.bashrc.local"

# Start with full-fledged prompt.
prompt on


