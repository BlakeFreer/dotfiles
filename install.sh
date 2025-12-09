#!/usr/bin/env bash

ln -sf $(pwd)/nvim ~/.config/
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/zathura ~/.config/
ln -sf $(pwd)/latexmk ~/.config/
ln -sf $(pwd)/tex-fmt ~/.config/
ln -sf $(pwd)/bashrc ~/.config/
ln -sf $(pwd)/git/gitconfig ~/.gitconfig-public

source ~/.bashrc
