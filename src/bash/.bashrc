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
export HISTIGNORE="&:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a"

# ------------------------------------------------------------------------------
# Editor

export EDITOR=vim
export VISUAL=vim

# ------------------------------------------------------------------------------
# Pager

export PAGER=less
export MANPAGER=less

# ------------------------------------------------------------------------------
# Aliases

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias l='ls -CF'
alias la='ls -lA'
alias ll='ls -l'
alias ls='ls --color=auto'

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
# Paths

[ -d "$HOME/.local/share/man" ] && MANPATH="$HOME/.local/share/man:$MANPATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

# ------------------------------------------------------------------------------
# Functions

mkcd() {
  mkdir -p "$*"
  cd "$*"
}

py-server() {
  local port="${1:-8001}"
  python3 -m http.server $port
}

__lf_ps1() {
    if [ -n "$LF_LEVEL" ]; then
        printf ':LF%01d' ${LF_LEVEL}
    fi
}

# ------------------------------------------------------------------------------

PS1="\u@\h:\w\$(__lf_ps1)\\$ "

# ------------------------------------------------------------------------------
# Git status
# https://github.com/git/git/tree/master/contrib/completion

#source ~/.git-prompt.sh
#PS1="\u@\h:\w\$(__lf_ps1)\$(__git_ps1 \" (%s)\")\\$ "

export PS1

