# ------------------------------------------------------------------------------
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------------------------------------------

shopt -s checkwinsize
shopt -s histappend

# ------------------------------------------------------------------------------

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTIGNORE="&:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a"

# ------------------------------------------------------------------------------

[ -n "$LF_LEVEL" ] && PS1="\e[0;41mlf:${LF_LEVEL}\e[0m:"${PS1}

export PS1

