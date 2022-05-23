# Node version manager
NVM_DIR="$HOME/.nvm"

# Local bin 
PATH="$PATH:/home/cloweling/.local/bin"

# SDKman
SDKMAN_DIR="/home/cloweling/.sdkman"

# NPM
PATH=~/.npm-global/bin:$PATH

# RVM
PATH="$PATH:$HOME/.rvm/bin"
GEM_HOME=~/.rvm/gems/default/bin
GEM_PATH=~/.rvm/gems/default/bin

# Editor/Browser
VISUAL="nvim"
EDITOR="nvim"
BROWSER=/usr/bin/google-chrome-stable

# XDG Base directory 
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_CACHE_HOME="$HOME/.cache"

# zsh
DISABLE_AUTO_TITLE='true'
HISTFILE="$HOME/.zsh_history"    
HISTSIZE=2000                      
SAVEHIST=2000                      

# Load file colors
LS_COLORS="$(vivid generate snazzy)"

# Load color Suggestion 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969696"

# Load color History Substring Search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=black,fg=white,bold" 
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=black,fg=red,bold"
