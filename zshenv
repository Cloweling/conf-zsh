# Node version manager
export NVM_DIR="$HOME/.nvm"

# Local bin 
export PATH="$PATH:/home/cloweling/.local/bin"

# SDKman
export SDKMAN_DIR="/home/cloweling/.sdkman"

# NPM
export PATH=~/.npm-global/bin:$PATH

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
export GEM_HOME=~/.rvm/gems/default/bin
export GEM_PATH=~/.rvm/gems/default/bin

# Editor/Browser
export VISUAL=/snap/bin/nvim
export EDITOR=/snap/bin/nvim
export BROWSER=/usr/bin/google-chrome-stable

# XDG Base directory 
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh
export DISABLE_AUTO_TITLE='true'
export HISTFILE="$HOME/.zsh_history"    
export HISTSIZE=2000                      
export SAVEHIST=2000                      

# Load file colors
export LS_COLORS="$(vivid generate snazzy)"

# Load color Suggestion 
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969696"

# Load color History Substring Search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=black,fg=white,bold" 
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=black,fg=red,bold"
