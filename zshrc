# ░▀▀█░█▀▀░█░█░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
# ░▄▀░░▀▀█░█▀█░░░█░░░█░█░█░█░█▀▀░░█░░█░█
# ░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀

export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias tmux="TERM=screen-256color-bce tmux" # for vi(m) to work with tmux

ENABLE_CORRECTION="true"  # enable command auto-correction

plugins=(
    z
    git 
    colorize
    web-search
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# language environment
export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='nvim'
fi

# custom functions

function lines() {
  # accepts the file name or extention as arg
  # and returns the number of line the file contanins
  # returns number of line
 find . -name $@ | xargs wc -l
}

function explorer() {
  # opens the file explorer in the cwd
  # args: none
 xdg-open $PWD 
}

function crypto() {
  # displays the crypto prices 
  # accepts the optional argument crypto symbol
  # example usage crypto eth
  curl rate.sx/"$@"
}

function weather() {
  # displays the weather in your location if no argumest supplyed
  # accepts optional argument location
  # example weather rome
  curl wttr.in/"$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
