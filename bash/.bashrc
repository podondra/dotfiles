# Maintainer: Ondrej Podsztavek
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen!

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
    # Shell is non-interactive. Be done now!
    return
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# save multiple-line command to the history with embeded newlines in 
# the same history entry
shopt -s cmdhist
shopt -s lithist

# the number of trailing directory components to retain when expanding
# the \w and \W pront string escapes
PROMPT_DIRTRIM=2

# enable extended pattern matching features
shopt -s extglob

# enable programmable completion facilities
shopt -s progcomp

# primary prompt string
PS1="\u@\h:"
case "$TERM" in
    screen|*color|xterm)
        PS1="$PS1\[\e[32m\]\w\[\e[0m\]"
        ;;
    *)
        PS1="$PS1:\w"
        ;;
esac

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias l='ls -CF'
alias ll='l -hl'
alias la='ll -A'
# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low \
    -i "$([ $? = 0 ] && echo terminal || echo error)" \
    "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# git completion
GIT_COMPLETION=~/.git-completion.bash
[[ -f "$GIT_COMPLETION" ]] && source "$GIT_COMPLETION"

# git prompt
GIT_PROMPT=~/.git-prompt.sh
if [[ -f "$GIT_PROMPT" ]]; then
    source "$GIT_PROMPT"
    PS1=$PS1'$(__git_ps1 " (%s)")\$ '
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_SHOWCOLORHINTS=1
else
    PS1="$PS1\$ "
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi

export EDITOR='vim'
