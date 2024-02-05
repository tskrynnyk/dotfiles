# ------------------------------------------------------------------------------
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------------------------------------------------

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, don't overwrite it
shopt -s histappend

# ------------------------------------------------------------------------------
# History

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTIGNORE="&:exit:history*:pwd"
export HISTTIMEFORMAT="%F %T "

# ------------------------------------------------------------------------------
# Editor

export EDITOR=vim
export VISUAL=vim

# ------------------------------------------------------------------------------
# Pager

export PAGER=less
export MANPAGER=less

# ------------------------------------------------------------------------------
# CDPATH

export CDPATH='.:~'

# ------------------------------------------------------------------------------
# Aliases

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias l='ls -CF'
alias la='ls -lA'
alias ll='ls -l'
alias ls='ls --color=auto'

alias path='echo -e ${PATH//:/\\n}'

# ------------------------------------------------------------------------------
# Bash completion

if ! shopt -oq posix; then
    if [ -f /usr/local/share/bash-completion/bash_completion.sh ]; then
        . /usr/local/share/bash-completion/bash_completion.sh
    elif [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ------------------------------------------------------------------------------
# PATH

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# clean up
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

# ------------------------------------------------------------------------------
# MANPATH

if command -v manpath &>/dev/null; then
    unset MANPATH
    export MANPATH=$(manpath -q)
fi

# ------------------------------------------------------------------------------
# Functions

__lf_ps1() {
    if [ -n "$LF_LEVEL" ]; then
        printf ':LF%01d' ${LF_LEVEL}
    fi
}

# ------------------------------------------------------------------------------
# PROMPT

export PROMPT_COMMAND="history -a"
export PROMPT_DIRTRIM=1

PS1='\[\033[40;90m\]\w\[\033[00m\]$(__lf_ps1)'

[ -n "$SSH_CONNECTION" ] && PS1="\u@\h:"${PS1}

# ------------------------------------------------------------------------------
# Git status
# https://github.com/git/git/tree/master/contrib/completion

#source ~/.git-prompt.sh
#PS1="\u@\h:\w\$(__lf_ps1)\$(__git_ps1 \" (%s)\")\\$ "

# ------------------------------------------------------------------------------
# bash.d

if [ -d ~/.local/share/bash.d ]; then
    for i in ~/.local/share/bash.d/*.sh; do . $i; done
fi

PS1=$PS1'\$ '
export PS1

