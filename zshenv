# Load Opcional
[ -s "$HOME/.alias.local" ] && source "$HOME/.alias.local"
[ -s "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# fnm
export PATH=$PATH:~/.local/share/fnm

# Local bin 
export PATH=$PATH:~/.local/bin

# Cargo
export PATH=$PATH:~/.cargo/bin

# SDKman
export SDKMAN_DIR=~/.sdkman

# NPM
export PATH=~/.npm-global/bin:$PATH

# Editor/Browser
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=/usr/bin/google-chrome-stable

# XDG Base directory 
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# zsh
export DISABLE_AUTO_TITLE='true'
export HISTFILE=$HOME/.zsh_history    
export HISTSIZE=2000                      
export SAVEHIST=2000                      

# Load file colors
export LS_COLORS="$(vivid generate snazzy)"

# Load color Suggestion 
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#969696"

# Load color History Substring Search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=black,fg=white,bold" 
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=black,fg=red,bold"
