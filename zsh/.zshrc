PATH=$PATH:/home/daniel/bin:/home/daniel/.gem/ruby/2.5.0/bin:/home/daniel/.local/bin:
export PATH
GOPATH=/home/daniel/gocode
export GOPATH
EDITOR=/usr/bin/nvim
export EDITOR
PAGER=/usr/bin/vimpager
export PAGER
CLICOLOR=1
export CLICOLOR
LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS

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
GEOMETRY_COLOR_PROMPT="green"
PROMPT_GEOMETRY_COMMAND_MAX_EXEC_TIME="3"
PROMPT_GEOMETRY_EXEC_TIME=true

antigen theme daveverwer

# Apply antigen configuration
antigen apply

# Aliases
#
alias fresh='freshcoat'
alias less='vimpager'
alias OMZ='antigen theme $(ls ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes | fzf)'
alias stellar='feh --bg-fill $(shuf -n 1 ~/bin/stellar.txt)'
alias earthly='feh --bg-fill $(shuf -n 1 ~/bin/prettyearth.txt)'
alias apod='feh --bg-fill $(shuf -n 1 ~/bin/apod.txt)'
alias awal='feh --bg-fill $(shuf -n 1 ~/bin/androidwalls.txt)'
alias ptrn='feh --bg-tile $(shuf -n 1 ~/bin/patterns.txt)'
alias ptbw='feh --bg-tile $(shuf -n 1 ~/bin/patternsbw.txt)'
eval $(thefuck --alias)

# Source fzf script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start X after logging in
if ! pgrep -x "bspwm" > /dev/null ;
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
