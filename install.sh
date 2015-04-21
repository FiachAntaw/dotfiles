#!/bin/sh

# Wipe existing config (dangerous!)
rm -rf ~/.antigen
rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.promptline.sh
rm -rf ~/.config/base16-shell
rm -f ~/.tmux.conf
rm -f ~/.tmuxline.conf
rm -rf ~/.vim
rm -f ~/.vimrc
rm -f ~/.zshrc

# Remove local copies of repos
rm -rf antigen/antigen
rm -rf vim/bundle/Vundle.vim

# Symlink dotfiles to home
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/promptline.sh ~/.promptline.sh
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/tmuxline.conf ~/.tmuxline.conf
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/zshrc ~/.zshrc

# Symlink .vim to home
mkdir -p `pwd`/vim/bundle
ln -s `pwd`/vim ~/.vim

# Symlink .config/base16-shell to home
mkdir -p ~/.config
ln -s `pwd`/config/base16-shell ~/.config/base16-shell

# Symlink .antigen to home
mkdir -p `pwd`/antigen
ln -s `pwd`/antigen ~/.antigen

# Install Antigen
git clone https://github.com/zsh-users/antigen.git ~/.antigen/antigen

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vundle plugins
vim +PluginInstall +qall

# Reload TMUX config
if [ -n "$TMUX" ]; then
  tmux source-file ~/.tmux.conf
fi

# Set up git
git config --global user.name "Fiach Antaw"
git config --global user.email "FiachAntaw@users.noreply.github.com"

