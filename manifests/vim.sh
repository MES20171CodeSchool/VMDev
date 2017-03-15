sudo apt-get -y install vim
rm -rf ~/.vim
git clone https://github.com/VictorArnaud/.vim.git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
