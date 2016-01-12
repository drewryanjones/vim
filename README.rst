VIM Python IDE Configuration and Plugins
==========================================
This repository contains VIM customizations to make it more of a Python IDE
The contents are as follows:

* vimrc - The configuration file, my ~/.vimrc links to this
* bundles - This contains all plugins. 
* bundles/Vundle.vim - This manages plugins.
* pyflakes - Script to enable Python syntax checker. 


Dependencies
------------
To properly use this configuration a current version must be available.


To setup on new machine
-----------------------
* ``git clone <this-repo> ~/.vim``
* ``ln -sf ~/.vim/vimrc ~/.vimrc``
* ``vim +PluginInstall +qall``

Ensure the depenedency 'bin' directory is added to path.


Vim Plugins
-----------
To install all plugins listed in ``Vundle`` block of vimrc:

* ``:PluginInstall`` (within vim)
* ``vim +PluginInstall +qall`` (command line)

Some useful plugin:

* Syntastic - Multi-language syntax highlighting and error checking. 
* Supertab - Code completion and help with ``tab`` key.
* NerdTree - Directory exploration, and file opening.
* TagList - Navigate between C-tag defs (classes,methods,ect).
