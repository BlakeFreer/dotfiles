#!/usr/bin/env bash

ln -sf $(pwd)/nvim ~/.config/
ln -sf $(pwd)/zathura ~/.config/
ln -sf $(pwd)/latexmk ~/.config/
ln -sf $(pwd)/tex-fmt ~/.config/
ln -sf $(pwd)/bashrc ~/.config/
ln -sf $(pwd)/git/gitconfig ~/.gitconfig-public
ln -sf $(pwd)/gitmux.conf ~/.gitmux.conf

# tmux
ln -sf $(pwd)/tmux ~/.config/
if pushd ~/.tmux/plugins/tpm; then
    git pull;
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;
fi
popd

source ~/.bashrc
