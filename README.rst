======
Usage
======


install
-------

.. code-block:: bash

    git clone https://github.com/leetpy/vim.git
    cd vim
    git submodule update --init --recursive
    python setup.py


leader key
----------

I use ',' as vim leader key, which you can set your own leader key
according to personal habits.

theme
-----

There are two nice theme for vim ``molokai`` and ``monokai``,
``molokai`` is better for code highlighting, but when you use
ssh, it didn't work. So I use ``monokai`` default.

You can chagne the theme by config ``~/.vimrc``::

    colorscheme molokai


templeate
---------

Templates are stored at ``~/.vim/template/``.

Add your own template

#. Touch template file in ``~/.vim/template/`` directory
#. Add mapping in vimrc::

    # for python file
    autocmd BufNewFile *.py 0r ~/.vim/template/py.tpl  " python

build
-----

I use ``<F4>`` for build. Currently supports Python C/C++, Go, Shell
and reStructedText.

short key
---------

=============== ==========
Name            Value
=============== ==========
NERDTreeToggle  F2
split           <leader>sp
pastetoggle     F9
=============== ==========

