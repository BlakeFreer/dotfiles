#!/usr/bin/env bash

PWD=$(eval pwd)

ln -sf $PWD/nvim ~/.config/
ln -sf $PWD/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/zathura/
ln -sf $PWD/zathura/zathurarc ~/.config/zathura/zathurarc

mkdir -p ~/.config/latexmk
ln -sf $PWD/latexmk/latexmkrc ~/.config/latexmk/latexmkrc

mkdir -p ~/.config/tex-fmt
ln -sf $PWD/tex-fmt/tex-fmt.toml ~/.config/tex-fmt/tex-fmt.toml
