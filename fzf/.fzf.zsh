# Setup fzf
# ---------
if [[ ! "$PATH" == */home/daniel/.fzf/fzf/bin* ]]; then
  export PATH="$PATH:/home/daniel/.fzf/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/daniel/.fzf/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/daniel/.fzf/fzf/shell/key-bindings.zsh"

