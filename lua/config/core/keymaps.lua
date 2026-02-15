local map = vim.keymap.set

local util = require "config.util"

-- Save / quit
map("n", "<leader>w", "<cmd>write<cr>",     { noremap = true, desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>",      { noremap = true, desc = "Quit" })

-- Better movement between splits (will be upgraded via smart-splits)
map("n", "<C-h>", "<C-w>h",                 { noremap = true, desc = "Go left split" })
map("n", "<C-j>", "<C-w>j",                 { noremap = true, desc = "Go down split" })
map("n", "<C-k>", "<C-w>k",                 { noremap = true, desc = "Go up split" })
map("n", "<C-l>", "<C-w>l",                 { noremap = true, desc = "Go right split" })

-- Better movement across text overall
map("n", "<M-j>", "12j",                    { noremap = true, desc = "Move 12 linues down" })
map("v", "<M-j>", "12j",                    { noremap = true, desc = "Move 12 linues down" })
map("n", "<M-k>", "12k",                    { noremap = true, desc = "Move 12 linues up" })
map("v", "<M-k>", "12k",                    { noremap = true, desc = "Move 12 linues up" })
map("n", "<s-h>", "^",                      { noremap = true, desc = "Move to first printable char" })
map("v", "<s-h>", "^",                      { noremap = true, desc = "Move to first printable char" })
map("n", "<s-l>", "100|",                   { noremap = true, desc = "Move to column 100 (or last char)" })
map("v", "<s-l>", "100|",                   { noremap = true, desc = "Move to column 100 (or last char)" })

-- Buffer navigation: stop drowning
map("n", "<leader><tab>", "<cmd>b#<cr>",    { noremap = true, desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>",            { noremap = true, desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>",        { noremap = true, desc = "Prev buffer" })

-- Quickfix basics
map("n", "]q", "<cmd>cnext<cr>",            { noremap = true, desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<cr>",            { noremap = true, desc = "Prev quickfix" })

-- Maps arrows to move in dir in Insert Mode
map('i', '<Left>', '<Left>',                { noremap = true, desc = "<Left> is <Left> in insert"})
map('i', '<Right>', '<Right>',              { noremap = true, desc = "<Right> is <Right> in insert"})

-- Punctuation helpers (insert-mode, home-row-ish)
-- If your terminal treats Alt/Option as Meta, these are life-changing.
local function pair(s)
  return function()
    local keys = s .. "<Left>"
    return vim.api.nvim_replace_termcodes(keys, true, false, true)
  end
end

-- Note(Danilo): Expr actually strictly needed to use this (requires expr=true) in macOS
map("i", "<M-a>", "()<Left>",               { noremap = true, desc = "Insert ()" })
map("i", "<M-s>", "[]<Left>",               { noremap = true, desc = "Insert []" })
map("i", "<M-d>", "{}<Left>",               { noremap = true, desc = "Insert {}" })
map("i", "<M-f>", '""<Left>',               { noremap = true, desc = 'Insert ""' })
map("i", "<M-g>", "''<Left>",               { noremap = true, desc = "Insert ''" })
map("i", "<M-j>", ";<Right>",               { noremap = true, desc = "Insert ;" }) -- yes, we’re cheating

-- Edit nvim config shortcuts
local init_file = nil
if util.get_os_name() == "windows" then
    init_file = vim.fn.expand(os.getenv("LOCALAPPDATA") .. "\\nvim\\init.lua")
else
    init_file = vim.fn.expand(os.getenv("XDG_CONFIG_HOME") .. "/nvim/init.lua")
end
map("n", "<leader>ce", ":e " .. init_file .. "<cr>", { desc = "Edit config file" })
map("n", "<leader>cs", ":so " .. init_file .. "<cr>", { desc = "Source config file" })
