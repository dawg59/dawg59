#================================================================#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
# Last modified: 7/17/2025 
# PERSONAL $HOME/.bashrc FILE for bash-5.3 (or later)
# My 1St bash config. Just some standard stuff.
# This file was designed for my computers.
# My bashrc file is a bit overcrowded - remember it is just an example. 
# This file is normally read by interactive shells only.
# If not running interactively, don't do anything
# =============================================================== #

[[ $- != *i* ]] && return

### PROMPT ###
# This is commented out if using prompt
PS1="\[\e[31m\]\s\[\e[m\]\[\e[31m\]\V\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[37m\]\\$\[\e[m\] "
# PS1="\[\e[31m\]\s\[\e[m\]\[\e[31m\]\v\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[34m\]\\$\[\e[m\] "

# --- History Control ---
export HISTSIZE=500
export HISTFILESIZE=1000

# Sudo last command
s() { # do sudo, or sudo the last command if no argument given
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

# Nice ls colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Automatic directory change
shopt -s autocd  # Enables automatic directory change when typing a directory name

#================================================================ #
#  ALIASES AND FUNCTIONS
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#  be converted into scripts and removed from here.
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#================================================================ #

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
alias blk='lsblk' # lsblk
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
alias bpy='bpytop' # bpytop
alias vi='vim' # vim

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Extracts any archive(s) (if unp isn't installed)
function extract {
 if [ $# -eq 0 ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 fi
    for n in "$@"; do
        if [ ! -f "$n" ]; then
            echo "'$n' - file doesn't exist"
            return 1
        fi

        case "${n%,}" in
          *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                       tar zxvf "$n"       ;;
          *.lzma)      unlzma ./"$n"      ;;
          *.bz2)       bunzip2 ./"$n"     ;;
          *.cbr|*.rar) unrar x -ad ./"$n" ;;
          *.gz)        gunzip ./"$n"      ;;
          *.cbz|*.epub|*.zip) unzip ./"$n"   ;;
          *.z)         uncompress ./"$n"  ;;
          *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar|*.vhd)
                       7z x ./"$n"        ;;
          *.xz)        unxz ./"$n"        ;;
          *.exe)       cabextract ./"$n"  ;;
          *.cpio)      cpio -id < ./"$n"  ;;
          *.cba|*.ace) unace x ./"$n"     ;;
          *.zpaq)      zpaq x ./"$n"      ;;
          *.arc)       arc e ./"$n"       ;;
          *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                            extract "$n.iso" && \rm -f "$n" ;;
          *.zlib)      zlib-flate -uncompress < ./"$n" > ./"$n.tmp" && \
                            mv ./"$n.tmp" ./"${n%.*zlib}" && rm -f "$n"   ;;
          *.dmg)
                      hdiutil mount ./"$n" -mountpoint "./$n.mounted" ;;
          *.tar.zst)  tar -I zstd -xvf ./"$n"  ;;
          *.zst)      zstd -d ./"$n"  ;;
          *)
                      echo "extract: '$n' - unknown archive method"
                      return 1
                      ;;
        esac
    done
}
# =============================================================== #
# Local Variables:
# sh-shell:bash
# End:
# =============================================================== #
