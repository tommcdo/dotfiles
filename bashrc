# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Git prompt shim
DOTFILEDIR="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"
source "$DOTFILEDIR/lib/git-prompt.sh"

PS1='\[\033[1;30m\]\t\[\033[0;30m\]|\[\033[00m\]${debian_chroot:+($debian_chroot)}\[\033[0;31m\]\u\[\033[00m\]@\[\033[0;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\](\[\033[0;36m\]$?\[\033[00m\])$(__git_ps1 "\[\033[1;36m\]{\[\033[0;33m\]%s\[\033[1;36m\]}\[\033[00m\]")\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
if [ ! -z "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND=$PROMPT_COMMAND';'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    alias tmux='tmux -2'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
