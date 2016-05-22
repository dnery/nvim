Danilo's nVim config
====================
This repository contains the nvim configuration, including rc-file and plug-ins
that I use on my linux install (all of them, in fact).

Installation
------------
The easiest way to install this is to run
```bash
git clone http://github.com/dnery/nvim ~/.config/nvim
```
The first time you open nvim, it will proceed to inst
[vim-plug](https://github.com/junegunn/vim-plug). From there, just run
```vimscript
:PlugInstall
```
from within nvim, and all the plug-ins listed in my `init.vim` will be
installed.
