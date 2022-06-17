eval "$(starship init zsh)"

# name Terminal
tmux rename-window -t 1 Terminal

autoload -Uz compinit && compinit -i # Load and initialize the completion system ignoring insecure directories.
_comp_options+=(globdots) # With hidden files

# emacs mode
bindkey -e

# fnm
eval "$(fnm env $ZSH_FNM_ENV_EXTRA_ARGS)"

# autocomplete tmuxp
eval "$(_TMUXP_COMPLETE=zsh_source tmuxp)"

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

## Hooks
autoload -U add-zsh-hook
fnm_autoload_hook () {
    node_config_path="$PWD"
    while [[ "$node_config_path" != "" && ! -f "$node_config_path/.nvmrc" && ! -f "$node_config_path/.node-version" ]]; do
        node_config_path=${node_config_path%/*}
    done

    node_current_alias="$(fnm current)"
    if [[ "$node_config_path" != "" ]]; then
        fnm_use_output="$(builtin cd -q "$node_config_path" && exec fnm use 2>&1)"
    else
        fnm_use_output="$(fnm use default 2>&1)"
    fi
    node_updated_alias="$(fnm current)"
    if [[ "$node_current_alias" != "$node_updated_alias" ]]; then
        echo "$fnm_use_output"
    fi
}
add-zsh-hook chpwd fnm_autoload_hook 
fnm_autoload_hook
rehash

## functions
source ~/.zsh/func/common.sh
source ~/.zsh/func/git.sh
source ~/.zsh/func/tmux.sh

## Alias
source ~/.zsh/alias/general.zsh
source ~/.zsh/alias/directory.zsh
source ~/.zsh/alias/git.zsh

# Keyword 
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down
