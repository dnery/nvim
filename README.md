My NeoVim Config
================
This repository contains all the nvim stuff for my linux system.

Installation
------------
The easiest way to install this is to run:
```bash
git clone http://github.com/dnery/nvim ~/.config/nvim
```
The first time you open nvim, it will proceed to install [vim-plug](https://github.com/junegunn/vim-plug) by itself.
From there, just run `:PlugInstall` from within nvim, and all the plug-ins listed in `init.vim` will be installed.


You might want to type in `,vs` in normal mode to re-source the config file so that everything loads properly.
The sequence means:
```
,   # 1. Custom: leader key invocation
v   # 2. Custom: pertains to my (v)imrc
s   # 3. Custom: (s)ource it; 'e' would mean (e)dit
```

Use it with vanilla Vim
-----------------------
Just symlink the `nvim` directory to your would-be `.vim` directory:
```bash
ln -s ~/.config/nvim ~/.vim
```
And done. I might automate this sometime.
