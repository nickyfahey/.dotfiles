#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BOLD="\[$(tput bold)\]"
COLOR="\[$(tput setaf 14)\]"
RESET="\[$(tput sgr0)\]"
PS1="\n${BOLD}${COLOR}\w\n>${RESET} "

export PATH="/home/nicky/bin:/home/nicky/.cargo/bin:$PATH"
export MAKEFLAGS="--jobs=$(nproc)"

alias ls='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

#pacman
alias pm-rm='sudo pacman -Rs'
alias pm-search='pacman -Q | grep'
alias pm-info='pacman -Qi'
alias pmr-search='pacman -Ss'
alias pmr-file='pacman -F'
alias pm-orphlist='pacman -Qdtq'
alias pm-orphrm='sudo pacman -Rs $(pacman -Qdtq)'

alias power='powerprofilesctl'
alias power-saver='powerprofilesctl set power-saver'
alias power-balance='powerprofilesctl set balanced'
alias power-game='powerprofilesctl set performance'

alias gpuwatch='watch -n 1 cat /sys/class/drm/card1/device/power/runtime_status'
