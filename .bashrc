#
#~/.bashrc
#
#If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
BROWN="\[$(tput setaf 4)\]"
GOLD="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 6)\]"
BRAK="\[$(tput setaf 2)\]"
CREAM="\[$(tput setaf 9)\]"
PS1="${BRAK}[${BROWN}\u@\h ${CREAM}\A${BLUE} \W${BRAK}]\$${GOLD} "
#PS1="[\u@\h \A \W]\$ "

neofetch --config /home/rounak/.config/neofetch/config.conf --source /home/rounak/Pictures/pixiv2.png --size 516px --gap 6

alias ss='grim -g "$(slurp)" - | imgur.sh'
alias pasters="curl --data-binary @- https://paste.rs/"
alias 0x0="curl -F 'file=@-' 0x0.st"
alias cvsh="curl -F 'file=@-' https://c-v.sh/"
alias ix="curl -F 'f:1=<-' ix.io"
alias u="sudo pacman -Syyu && yay && flatpak update"
alias r="ranger"
eval "$(thefuck --alias)"
eval "$(thefuck --alias f)"
