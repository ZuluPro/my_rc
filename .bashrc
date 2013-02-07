# System-wide .bashrc file for interactive bash(1) shells.

# Stop if non-interactive shell
[ -z "$PS1" ] && return

# Environement
export EDITOR=vim

# More completion if available
[ -f /etc/bash_completion ] && . /etc/bash_completion

# No twice commands in history 
export HISTCONTROL=ignoredups

# My prompt : Red for root, yellow for else
if [ $USER == 'root' ];
    then PS1="\[\033[1;31m\][\u@\h:\w]$\[\033[0m\] "
    else PS1="\[\033[1;33m\][\u@\h:\w]$\[\033[0m\] "
fi

# update the values of LINES and COLUMNS at each commands.
shopt -s checkwinsize

# Aliases
if [ "$(uname)" == 'Darwin' ] ; then
    alias ls='ls -Glh'
else
    alias ls='ls --color=auto -lh'
fi
alias grep='grep --color=auto'
alias du='du -h'
if [ $USER != 'root' ]; then
    alias ifup='sudo ifup'
    alias ifdown='sudo ifdown'
    alias service='sudo service'
    alias ntpdate-debian='sudo ntpdate-debian'
fi

# Nerver forger sudo
if ( which sudo > : ) ; then
    which updatedb && alias updatedb='sudo updatedb'
fi
