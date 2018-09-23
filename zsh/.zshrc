PATH=$PATH:/home/daniel/bin:/home/daniel/.gem/ruby/2.5.0/bin:/home/daniel/.local/bin:$HOME/.yarn/bin
export PATH
GOPATH=/home/daniel/gocode
export GOPATH
EDITOR=/usr/bin/nvim
export EDITOR
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify

bindkey -e

zstyle :compinstall filename '/home/daniel/.zshrc'
autoload -Uz compinit
compinit


nplayer() (nc -kluw 1 127.0.0.1 5555 > /tmp/mpd.fifo & trap "kill $!" EXIT; ncmpcpp)

dtop() (feh --bg-scale $(http --pretty=format https://api.desktoppr.co/1/wallpapers/random | grep jpg | awk -F\" 'NR >=3{ print $4}' ))


# Source antigen
source /home/daniel/.antigen/antigen.zsh

# Load oh-my-zsh.
antigen use oh-my-zsh

# Load bundles .
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Goles/battery

# Load (and configure) the theme.
SPACESHIP_PROMPT_ORDER=(
time
user
host
dir
node
char
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_COLOR_SECONDARY="#6F4EBC"
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="002"
SPACESHIP_TIME_FORMAT="%K{004} %D{%I:%M}%k"
SPACESHIP_TIME_SUFFIX="%K{004} %k"
SPACESHIP_HOST_SHOW=always
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=" "
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_PREFIX="%F{006} at %f"
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_HOST_COLOR_PREFIX=""
SPACESHIP_USER_COLOR="005"
SPACESHIP_HOST_COLOR="003"
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX="%F{006} in %f"
SPACESHIP_DIR_COLOR="003"
SPACESHIP_DIR_TRUNC=3
SPACESHIP_NODE_COLOR='001'
SPACESHIP_DIR_SUFFIX=" "

antigen theme spaceship

# Apply antigen configuration
antigen apply

# Aliases
#
alias fresh='freshcoat'
alias OMZ='antigen theme $(ls ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes | fzf)'
alias stellar='feh --bg-fill $(shuf -n 1 ~/bin/stellar.txt)'
alias earthly='feh --bg-fill $(shuf -n 1 ~/bin/prettyearth.txt)'
alias apod='feh --bg-fill $(shuf -n 1 ~/bin/apod.txt)'
alias awal='feh --bg-fill $(shuf -n 1 ~/bin/androidwalls.txt)'
alias ptrn='feh --bg-tile $(shuf -n 1 ~/bin/patterns.txt)'
alias ptbw='feh --bg-tile $(shuf -n 1 ~/bin/patternsbw.txt)'

# Source fzf script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start X after logging in
if ! pgrep -x "bspwm" > /dev/null ;
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
