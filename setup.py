#!/usr/bin/env python
#-*- coding: utf-8 -*-
import os
import shutil


def clean(home):
    shutil.rmtree(os.path.join(home, ".vim"))
    os.remove(os.path.join(home, ".vimrc"))


if __name__ == "__main__":
    workdir = os.path.dirname(os.path.abspath(__file__))
    HOME = os.getenv("HOME")
    clean(HOME)

    target_vim_dir = os.path.join(HOME, ".vim")
    target_vimrc_path = os.path.join(HOME, ".vimrc")

    shutil.copytree(os.path.join(workdir, 'vim'), target_vim_dir)
    shutil.copy2(os.path.join(workdir, 'vimrc'), target_vimrc_path)

    # theme setting
    shutil.move(os.path.join(target_vim_dir, "molokai/colors"),
                os.path.join(target_vim_dir, "colors"))
    shutil.rmtree(os.path.join(target_vim_dir, "molokai"))

