# ------------------------------------------------------------------------------
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------------------------------------------

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# ------------------------------------------------------------------------------

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTIGNORE="&:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a"

# ------------------------------------------------------------------------------

PS1='[\u@\h \W]\$ '

[ -n "$LF_LEVEL" ] && PS1="\e[0;41mlf:${LF_LEVEL}\e[0m:"${PS1}

export PS1

