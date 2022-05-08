#! /bin/sh
NAME_DIRECTORY_FILE="zsh"
ROOT_PATH=~/.$NAME_DIRECTORY_FILE

echo "Remove old files..."
# Delete old directory
[ -d $ROOT_PATH ] &&  rm -rf $ROOT_PATH

# Delete old file zshrc
[ -f ~/.zshrc ] && rm ~/.zshrc

# Delete old file enviroment
[ -f ~/.zshenv ] && rm ~/.zshenv
echo "Done!"

# Download repository
echo "Downloading repository..."
cd /tmp
wget -q https://github.com/Cloweling/conf-zsh/archive/refs/heads/main.zip -O zsh_tmp.zip
unzip -q zsh_tmp.zip
mv conf-zsh-main $ROOT_PATH
rm zsh_tmp.zip
echo "Done!"

# Install plugins
echo "Installing plugins..."
cd $ROOT_PATH
git clone -q git@github.com:marlonrichert/zcolors.git plugins/zcolors
git clone -q git@github.com:Aloxaf/fzf-tab.git plugins/fzf-tab
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting
git clone -q https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions
git clone -q https://github.com/zsh-users/zsh-history-substring-search.git plugins/zsh-history-substring-search
echo "Done!"

# install zshrc
echo "Installing file zsh..."
mv zshrc ~/.zshrc
mv zshenv ~/.zshenv
echo "Done!"