#================================================================ #
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#  be converted into scripts and removed from here.
#
#================================================================ #

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help' # help bashrc
alias h='history' # history
alias cls='clear' # clear terminal
alias q='exit' # quit
alias src='source ~/.bashrc' #  restart bash

# Alias's for multiple directory listing commands
alias ls='lsd -F'  # wide format directories only
alias ll='ls -lh'  # Human-readable ls
alias la='lsd -Fa' # wide format hidden files
alias tree='tree --dirsfirst -F'

# Change directory aliases
alias home='cd ~' # cd home
alias ..='cd ..' # cd home
alias ...='cd ../..'
alias mkdir='mkdir -p -v' # make dir

# some package aliases
alias remove='sudo pacman -Rn'   # remove orphaned packages
alias install='sudo pacman -S'   # install only standard pkgs
alias update='sudo pacman -Syu'  # update only standard pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'  # remove pacman lock
alias reboot='sudo reboot now'  # reboot system

# fastfetch & geany aliases
alias ffetch='fastfetch --logo small'  # fastfetch
alias bg='geany ~/.bashrc' # geany bashrc
alias vi='vim' # vim

# tar aliases
alias untar='tar -zxvf ' # un-tar
alias tarnow='tar -acf ' # tar

# =============================================================== #
# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
# =============================================================== #





