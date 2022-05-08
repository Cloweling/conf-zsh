# Init Tmux
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux new-session
    tmux rename-window -t 1 Terminal
fi

eval "$(starship init zsh)"

autoload -Uz compinit && compinit -i # Load and initialize the completion system ignoring insecure directories.
_comp_options+=(globdots) # With hidden files

# Emacs mode
bindkey -e

# Options
setopt ALWAYS_TO_END # move cursor to end if word had one match
setopt PATH_DIRS # Perform path search even on command names with slashes.
setopt AUTO_LIST # automatically list choices on ambiguous completion
setopt AUTO_MENU # automatically use menu completion
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash.
setopt HIST_IGNORE_ALL_DUPS # remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS # remove superfluous blanks from history items
setopt INC_APPEND_HISTORY # save history entries as soon as they are entered
setopt SHARE_HISTORY # share history between different instances of the shell
setopt COMPLETE_ALIASES
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'


## File loads
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# RVM fixes whatever it considers the problem to be, on its own, in `rvm use`.
# It also prints some junk we don't care about, so we squelch its output in the same way.
rvm use default > /dev/null 2>&1

## Hooks
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

## functions
source ~/.zsh/functions

## Alias
source ~/.zsh/alias/general.zsh
source ~/.zsh/alias/directory.zsh
source ~/.zsh/alias/git.zsh

# Keyword 
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
