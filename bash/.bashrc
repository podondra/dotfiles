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

# Put your fun stuff here.

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

# aliases
alias l='ls -l'
alias ll='ls -laF'

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
