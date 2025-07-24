# ===============================================================#
# Last modified: 7/17/2025 
# PERSONAL $HOME/.bashrc FILE for bash-5.3 (or later)
# My 1St bash config. Just some standard stuff.
# This file was designed for my Arch/CachyOS computers.
# My bashrc file is a bit overcrowded - remember it is just an example. 
# This file is normally read by interactive shells only.
# If not running interactively, don't do anything
# =============================================================== #

[[ $- != *i* ]] && return

### PROMPT ###
# This is commented out if using prompt
PS1="\[\e[31m\]\s\[\e[m\]\[\e[31m\]\V\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[37m\]\\$\[\e[m\] "

# --- History Control ---
export HISTSIZE=500
export HISTFILESIZE=1000

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

shopt -s autocd  # Enables automatic directory change when typing a directory name

#================================================================ #
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#  be converted into scripts and removed from here.
#
#================================================================ #

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
alias bye='exit' # quit
alias src='source ~/.bashrc' #  restart bash

# Alias's for multiple directory listing commands
alias ls='lsd -F'  # wide format directories only
alias ll='ls -Flh'  # Human-readable ls
alias la='ls -Fa' # wide format hidden files
alias tree='tree --dirsfirst -F'

# Change directory aliases
alias home='cd ~' # cd home
alias ..='cd ..' # cd home
alias ...='cd ../..'
alias mkdir='mkdir -p' # make dir

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

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# =============================================================== #
# Local Variables:
# sh-shell:bash
# End:
# =============================================================== #
