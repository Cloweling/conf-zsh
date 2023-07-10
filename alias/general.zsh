alias ls='lsd'
alias l='ls'
alias ll='ls -lhF'
alias la='ls -AlhF'

alias c='clear'
alias h='history'
alias e='exit'
alias grep='grep --color=auto'
alias wget='wget -c'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias df='df -Th --total | sort -h -r | column -t'

alias sysll="systemctl list-unit-files"
alias syslls="systemctl list-unit-files --type=service"
