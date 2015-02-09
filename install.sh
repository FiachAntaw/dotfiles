#!/bin/sh

# Wipe existing config (dangerous!)
rm -f ~/.bashrc
rm -f ~/.bash_aliases
rm -f ~/.tmux.conf
rm -f ~/.tmuxline.conf
rm -f ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.config/base16-shell

# Symlink dotfiles to home
ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/tmuxline.conf ~/.tmuxline.conf
ln -s `pwd`/vimrc ~/.vimrc

# Symlink .vim to home
mkdir -p `pwd`/vim/bundle
ln -s `pwd`/vim ~/.vim

# Symlink .config/base16-shell to home
mkdir -p ~/.config
ln -s `pwd`/config/base16-shell ~/.config/base16-shell

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vundle plugins
vim +PluginInstall +qall

# Reload TMUX config
if [ -n "$TMUX" ]; then
  tmux source-file ~/.tmux.conf
fi

