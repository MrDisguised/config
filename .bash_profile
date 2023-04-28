#
#~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#exec Hyprland
#fi

##My environment variables

#Default text editor
export EDITOR=nvim
export VISUAL=nvim
###################
##My Aliases
export PATH="${PATH}:/home/rounak/.local/bin"
export PATH="${PATH}:/home/rounak/go/bin"
export PATH="${PATH}:/home/rounak/java/bin"

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec Hyprland
fi
