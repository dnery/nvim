My NeoVim Config
================
This repository contains all the nvim stuff for my linux system.

Installation
------------
The easiest way to install this is to run:
```bash
git clone http://github.com/dnery/nvim ~/.config/nvim
```
The first time you open nvim, it will proceed to install
[vim-plug](https://github.com/junegunn/vim-plug) by itself.
From there, just run `:PlugInstall` from within nvim, and all the plug-ins
listed in `init.vim` will be installed. You might want to type in `,sv` in
normal mode to re-source the config file so that everything loads properly.

Use it with vanilla Vim
-----------------------
Just symlink the `nvim` directory to your would-be `.vim` directory:
```bash
ln -s ~/.config/nvim ~/.vim
```
And then hardlink the `init.vim` file to your would-be `vimrc` file:
```bash
ln ~/.config/nvim/init.vim ~/.vim/vimrc
```
And done. I might automate this sometime.
