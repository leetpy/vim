======
Usage
======


Install
=======

.. code-block:: console

    $ git clone https://github.com/leetpy/vim.git
    $ cd vim
    $ ./run.sh

Update
======

You can update all plugins by execute follow commands:

.. code-block:: bash

    $ cd ~/.MyVim
    $ git pull
    $ git submodule foreach --recursive git submodule init 
    $ git submodule foreach --recursive git submodule update 


Key Map
=======

Leader key
----------

I use ``,`` as vim leader key, which you can set your own leader key
according to personal habits.

Theme
=====

Both ``molokai`` and ``monokai`` are nice theme,
``molokai`` is better for code highlighting, but when you use
ssh, it didn't work. So I use ``monokai`` default.

You can chagne the theme by config ``~/.vimrc``::

    colorscheme molokai


Templeate
=========

Templates are stored at ``~/.vim/template/``.

Add your own template

#. Touch template file in ``~/.vim/template/`` directory
#. Add mapping in vimrc::

    # for python file
    autocmd BufNewFile *.py 0r ~/.vim/template/py.tpl  " python

Build
=====

I use ``<F4>`` for build. Currently supports Python C/C++, Go, Shell
and reStructedText.

Short key
---------

=============== ==========
Name            Value
=============== ==========
NERDTreeToggle  <F2>
split           sp
pastetoggle     <F9>
=============== ==========

