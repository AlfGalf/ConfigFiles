
# Oh my ZSH theme
ZSH_THEME="rkj-repos"

# Use a sansible date format...
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
  command-not-found 
  autojump 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  osx)

export ZSH=/Users/alfierichards/.oh-my-zsh/

# Add oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
 export LANG=en_UK.UTF-8

# Preferred editor 
 export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

prompt_context(){}

# Run tmux automatically on zsh lunch
if [ "$TMUX" = "" ] && [ "$TERM" != "xterm" ]; then tmux attach -t TMUX || tmux new -s TMUX; fi

# Set default terminal behaviour to emulate vim 
bindkey -v

# Alias for NOT using rm unless I really mean to
alias rm="echo Don't use rm! Use rmtrash instead (or /bin/rm)"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=gray"

