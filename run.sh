#!/bin/bash

SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)

function backup {

    # vimrc
    if [ -f "$HOME/.vimrc" ]; then
        mv "$HOME/.vimrc" "$HOME/.vimrc_bk"
    fi

    # vim
    if [ -d "$HOME/.vim" ]; then
        mv "$HOME/.vim" "$HOME/.vim_bk"
    fi
}

function install {
    cd $SCRIPT_HOME
    echo "[x] clone vim plugins..."
    git submodule update --init --recursive > /dev/null
    echo "[x] clone vim plugins finished"

    MyVim=$HOME/.MyVim
    if [ -d "$MyVim" ]; then
        rm -rf "$MyVim"
    fi
    cp -R $SCRIPT_HOME $HOME/.MyVim

    ln -s $MyVim/vimrc $HOME/.vimrc
    ln -s $MyVim/vim $HOME/.vim
}


backup
install
