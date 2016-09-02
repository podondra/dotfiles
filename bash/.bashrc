# Maintainer: Ondrej Podsztavek
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen!

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
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
case ${TERM} in
	screen|*color|xterm)
		PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
		;;
	*)
		PS1='\u@\h:\w\$ '
		;;
esac

# Aliases
alias l='ls -l'
alias ll='ls -laF'
