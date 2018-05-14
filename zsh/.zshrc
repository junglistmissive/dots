# Lines configured by zsh-newuser-install
PATH=$PATH:/home/daniel/bin
export PATH
GOPATH=/home/daniel/gocode
export GOPATH

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall



zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
nplayer () (nc -kluw 1 127.0.0.1 5555 > /tmp/mpd.fifo & trap "kill $!" EXIT; ncmpcpp)

source /home/daniel/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Goles/battery
antigen bundle holman/spark
# Load the theme.
antigen theme cypher

# Tell Antigen that you're done.
antigen apply

alias fresh='freshcoat'
alias squish='squash $(ls ~/.config/squash/themes | fzf ) > /dev/null 2&>1'
alias OMZ='antigen theme $(ls ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes | fzf)'
alias stellar='feh --bg-fill $(cat ~/stellar.txt | shuf -n 1)'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

