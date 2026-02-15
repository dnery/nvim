-- Imports are rooted at /lua

-- Faster module loading (safe in modern Neovim)
pcall(function()
	vim.loader.enable()
end)

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- Load modular config
require("config")

print "Init complete"
