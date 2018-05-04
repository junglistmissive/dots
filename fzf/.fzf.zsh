# Setup fzf
# ---------
if [[ ! "$PATH" == */home/daniel/.fzf/bin* ]]; then
  export PATH="$PATH:/home/daniel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/daniel/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/daniel/.fzf/shell/key-bindings.zsh"

