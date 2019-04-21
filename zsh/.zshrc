PATH=$HOME/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin:$PATH
export PATH
EDITOR=/usr/bin/nvim
export EDITOR
export CLICOLOR=1
export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd beep extendedglob nomatch notify

bindkey -e

autoload -Uz compinit
compinit

# Source antigen

source $HOME/.antigen/antigen.zsh


# Load bundles .

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting


# Load (and configure) the theme.
antigen theme geometry-zsh/geometry

# Apply antigen config

antigen apply

# Aliases

alias fresh='freshcoat'
alias ptbw='feh --bg-tile $(shuf -n 1 ~/bin/patternsbw.txt)'
alias ls='ls --color=auto'
alias pip='pip3'
alias python='python3'
alias dmenu_run='~/.config/dmenu/dmenu-bind.sh'
alias ans='python2 ~/bin/AnsRender.py $@'
# Source fzf script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Start X after logging in
if ! pgrep -x "bspwm" > /dev/null ;
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi


