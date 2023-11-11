eval "$(starship init zsh)"

autoload -Uz compinit && compinit -i # Load and initialize the completion system ignoring insecure directories.
_comp_options+=(globdots) # With hidden files

# emacs mode
bindkey -e

# fnm
eval "$(fnm env --use-on-cd)"

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

source /usr/share/doc/pkgfile/command-not-found.zsh

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-pad 120 0
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -l --color=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'exa -l --color=always $realpath'
zstyle ':fzf-tab:complete:ll:*' fzf-preview 'exa -l --color=always $realpath'

zstyle ':fzf-tab:complete:systemctl-(status|(re|)start|(dis|en)able):*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:systemctl-show:*' fzf-preview 'systemctl show $word | bat --color=always -plini'
zstyle ':fzf-tab:complete:git-switch:*' fzf-preview 'git log --pretty=format:"%C(auto)%s (%C(bold blue)%an%C(reset))" $word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
 zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

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
