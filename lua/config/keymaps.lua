----------------------------------------------------------------------------------------------------
-- TITLE : keymaps.lua
-- ABOUT : Leader, personal keymaps & overrides for all modes
----------------------------------------------------------------------------------------------------

-- Leader
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- Clear search highlights
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>", { desc = "Clear search highlights" })

-- Center screen when jumping around
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<cr>", { desc = "Previous buffer" })

-- Better navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<a-j>", "12j",  { desc = "Move 12 linues down" })
vim.keymap.set("v", "<a-j>", "12j",  { desc = "Move 12 linues down" })
vim.keymap.set("n", "<a-k>", "12k",  { desc = "Move 12 linues up" })
vim.keymap.set("v", "<a-k>", "12k",  { desc = "Move 12 linues up" })
vim.keymap.set("n", "<s-h>", "^",    { desc = "Move to first printable char" })
vim.keymap.set("v", "<s-h>", "^",    { desc = "Move to first printable char" })
vim.keymap.set("n", "<s-l>", "100|", { desc = "Move to column 100 (or last char)" })
vim.keymap.set("v", "<s-l>", "100|", { desc = "Move to column 100 (or last char)" })

-- Edit shortcuts
local conf_file = vim.fn.expand(os.getenv("LOCALAPPDATA") .. "\\nvim\\init.lua")
vim.keymap.set("n", "<leader>ce", ":e " .. conf_file .. "<cr>", { desc = "Edit config file" })
vim.keymap.set("n", "<leader>cs", ":so " .. conf_file .. "<cr>", { desc = "Source config file" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<cr>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines up/down vscode style (conflicts with current nav setup)
-- vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
-- vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
-- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick leader shortcuts
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Exit file" })

-- Better J behavior (keeps cursor position)
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Tweaky S behavior (break lines on demand before 100ch mark)
vim.keymap.set("n", "S", "mz100|F s<cr><esc>`z", { desc = "Break lines agressively" })

-- Surround selection (mostly covered by mini.surround)
-- vim.keymap.set("v", "s(", "<esc>`>a)<esc>`<i(<esc>", { remap = false })
-- vim.keymap.set("v", "s)", "<esc>`>a)<esc>`<i(<esc>", { remap = false })
-- vim.keymap.set("v", "s{", "<esc>`>a}<esc>`<i{<esc>", { remap = false })
-- vim.keymap.set("v", "s}", "<esc>`>a}<esc>`<i{<esc>", { remap = false })
-- vim.keymap.set("v", "s[", "<esc>`>a]<esc>`<i[<esc>", { remap = false })
-- vim.keymap.set("v", "s]", "<esc>`>a]<esc>`<i[<esc>", { remap = false })

-- Make it easier to work with quotes in Python (covered by mini.surround)
-- vim.keymap.set("n", "cid", "ci\"", { desc = "Change inside double quotes" })
-- vim.keymap.set("n", "cis", "ci'", { desc = "Change inside single quotes" })
-- vim.keymap.set("n", "cad", "ca\"", { desc = "Change around double quotes" })
-- vim.keymap.set("n", "cas", "ca'", { desc = "Change around single quotes" })
-- vim.keymap.set("n", "vid", "vi\"", { desc = "Select inside double quotes" })
-- vim.keymap.set("n", "vis", "vi'", { desc = "Select inside single quotes" })
-- vim.keymap.set("n", "vad", "va\"", { desc = "Select around double quotes" })
-- vim.keymap.set("n", "vas", "va'", { desc = "Select around single quotes" })
