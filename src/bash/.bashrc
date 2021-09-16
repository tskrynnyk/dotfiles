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
# History

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTIGNORE="&:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a"

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

# ------------------------------------------------------------------------------

PS1='[\u@\h \W]\$ '

[ -n "$LF_LEVEL" ] && PS1="\e[0;41mlf:${LF_LEVEL}\e[0m:"${PS1}

export PS1

