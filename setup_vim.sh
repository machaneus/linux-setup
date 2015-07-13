#!/bin/bash
# Setup vim with vundle,airline,ycm plugins

echo "---- Setting up .vimrc file... ----"

if [ ! -f .vimrc ]; then
    echo "Error: .vimrc not found!"
    echo " -- Installation canceled "
    exit 1
fi

cp .vimrc ~

echo "---- Installing vim... ----"
sudo apt-get -y install vim

echo "---- Installing vundle... ----"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "---- Installing airline... ----"
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

echo "---- Installing ycm prerequisites... ----"
sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev

echo "---- Installing ycm... ----"
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer

echo "---- Configuring plugins... ----"
vim +BundleInstall +qall

echo "---- Done! ----"
cd ~
