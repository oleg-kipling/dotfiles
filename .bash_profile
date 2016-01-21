export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Flex build
PATH="$PATH:/usr/local/flex/bin"
export PATH

# npm
export PATH="$PATH:/usr/local/share/npm.bin"

# Vi mode in terminal
# set -o vi

# Aliases
alias ghb="cd ~/Documents/Dropbox/Github/"
alias css="cd ~/Documents/Dropbox/Github/css/"
alias js="cd ~/Documents/Dropbox/Github/js/"
alias jq="cd ~/Documents/Dropbox/Github/jquery/"
alias ori="cd ~/Documents/Dropbox/Github/holiadvice-sources/"
alias lime="cd ~/Documents/Dropbox/Github/limejs/"
alias samurai="cd ~/Documents/Dropbox/Github/samurai/"
alias desk="cd ~/Desktop/"
alias jeky="cd ~/Documents/Dropbox/Github/jekyll"
alias ang="cd ~/Documents/Dropbox/Github/Angular/"

# Github
alias gs='git status'
alias ga='git add -A .'
alias gp='git push origin master'
alias gu='git pull origin master'
alias gc='git commit -m "'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	    tput sgr0
	        if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
			MAGENTA=$(tput setaf 9)
			ORANGE=$(tput setaf 172)
			GREEN=$(tput setaf 64)
			PURPLE=$(tput setaf 141)
			WHITE=$(tput setaf 0)
		else
			MAGENTA=$(tput setaf 5)
			ORANGE=$(tput setaf 4)
			GREEN=$(tput setaf 2)
			PURPLE=$(tput setaf 1)
			WHITE=$(tput setaf 7)
		fi
			BOLD=$(tput bold)
			RESET=$(tput sgr0)
		else	
			MAGENTA="\033[1;31m"
			ORANGE="\033[1;33m"
			GREEN="\033[1;32m"
			PURPLE="\033[1;35m"
			WHITE="\033[1;37m"
			BOLD=""
			RESET="\033[m"
		fi

parse_git_dirty () {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
