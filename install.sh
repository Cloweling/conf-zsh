#! /bin/sh
NAME_DIRECTORY_FILE="zsh"
ROOT_PATH=~/.$NAME_DIRECTORY_FILE

# Delete old directory
[ -d $ROOT_PATH ] && rm -rf $ROOT_PATH

# Delete old file zshrc
[ -f ~/.zshrc ] && rm ~/.zshrc

# Install repository
cd ~
git clone https://github.com/Cloweling/conf-zsh.git .$NAME_DIRECTORY_FILE

# Install plugins
cd $ROOT_PATH
git clone git@github.com:marlonrichert/zcolors.git plugins/zcolors
git clone git@github.com:Aloxaf/fzf-tab.git plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git plugins/zsh-history-substring-search

# install zshrc
cp zshrc ~/.zshrc
