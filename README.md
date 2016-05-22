Danilo's NeoVim Config
======================
This repository contains the nvim configuration, including rc-file and plug-ins
that I use on my current linux install (And will be so on any future install,
for that matter).
![label](http://i.imgur.com/r87cC7Z.png "Demo Screenshot")

Installation
------------
The first thing you'll need is, obviously, NeoVim, so
[go get it](https://github.com/neovim/neovim/wiki/Installing-Neovim) if you
don't already have it. The easiest way to install this, then, is to run:
```bash
git clone http://github.com/dnery/nvim ~/.config/nvim
```
The first time you open nvim, it will proceed to install
[vim-plug](https://github.com/junegunn/vim-plug) by itself.
From there, just run
```vimscript
:PlugInstall
```
from within nvim, and all the plug-ins listed in my `init.vim` will be
installed. You might also want to type in `,sv` in normal mode to re-source
the configuration file so the solarized theme can be properly loaded in, if
you want to use it right off the bat... I'll fix this sometime.

But I Wanna Use It With Regular Vim!
------------------------------------
No problem. Just symlink the `nvim` directory to your would-be `.vim` directory:
```bash
ln -s ~/.config/nvim ~/.vim
```
And then hardlink the `init.vim` file to your would-be `vimrc` file:
```bash
ln ~/.config/nvim/init.vim ~/.vim/vimrc
```
And you're good to go. I might include a script to automate this, eventually...
