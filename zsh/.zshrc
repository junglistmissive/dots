PATH=$PATH:/home/daniel/bin:/home/daniel/.gem/ruby/2.5.0/bin:/home/daniel/.local/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin/
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

# Source antigen
source /home/daniel/.antigen/antigen.zsh

# Load oh-my-zsh.
antigen use oh-my-zsh

# Load bundles .
antigen bundle lukechilds/zsh-nvm
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting




# Load (and configure) the theme.
SPACESHIP_PROMPT_ORDER=(
char
)
SPACESHIP_RPROMPT_ORDER=(
dir
node
venv
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_SYMBOL="("
SPACESHIP_VENV_PREFIX="%F{001} %f"
SPACESHIP_VENV_SUFFIX="%F{001})%f"
SPACESHIP_VENV_COLOR="001"
SPACESHIP_NODE_SYMBOL="%F{004}《%f"
SPACESHIP_NODE_SUFFIX="%F{004} 》%f"
SPACESHIP_VENV_GENERIC_NAMES=(virtualenv)
SPACESHIP_CHAR_SYMBOL="%F{001}$(echo -e '\u2771')%f%F{003}$(echo -e '\u2771')%f%F{002}$(echo -e '\u2771')%f "
SPACESHIP_CHAR_COLOR_SECONDARY="#6F4EBC"
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX="%F{003} in %f"
SPACESHIP_SUB_DIR_PREFIX="./"
SPACESHIP_DIR_COLOR="002"
SPACESHIP_DIR_TRUNC=4
SPACESHIP_DIR_TRUNC_PREFIX="~/"
SPACESHIP_NODE_COLOR='010'
SPACESHIP_DIR_SUFFIX=" "

antigen theme spaceship

# Apply antigen configuration
antigen apply

# Aliases
#
alias fresh='freshcoat'
alias ptbw='feh --bg-tile $(shuf -n 1 ~/bin/patternsbw.txt)'

# Source fzf script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start X after logging in
if ! pgrep -x "bspwm" > /dev/null ;
then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
