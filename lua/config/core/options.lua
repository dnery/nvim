local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

local util = require "config.util"


--[[ Preface ]]

-- Compatibility
if not unpack then
    unpack = table.unpack
end


--[[ Definitions ]]

-- "Show column" config block
local show_col_config = { 0, "ColorColumn", { bg = "#424242" } }

-- Undo dir location definition
local undo_dir_path = nil
if util.get_os_name() == "windows" then
    undo_dir_path = vim.fn.expand(os.getenv("TEMP") .. "\\undodir")
else
    undo_dir_path = vim.fn.expand(os.getenv("TMPDIR") .. "undodir")
end

-- GUI cusor config block
local gui_cursor_config = {
    -- Normal, visual, cli
    "n-v-c:block",
    -- Insert, cli insert, visual-exclusive
    "i-ci-ve:block",
    -- Replace, cli replace
    "r-cr:hor20",
    -- Operator-pending
    "o:hor50",
    -- All modes: blinking & hl'ing groups
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    -- "Showmatch" mode
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}


--[[ UI ]]

-- Colors
cmd.colorscheme("elflord")
api.nvim_set_hl(0, "Normal", { bg = "none" })
api.nvim_set_hl(0, "NormalNC", { bg = "none" })
api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- Line numbers
opt.number = true
-- Relative line numbers
opt.relativenumber = true
-- Highlight current line
opt.cursorline = true
-- Don't wrap lines
opt.wrap = false
-- Keep 10 lines above/below cursor 
opt.scrolloff = 10
-- Keep 8 columns left/right of cursor
opt.sidescrolloff = 8
-- Use ripgrep for grepping
opt.grepprg = "rg --vimgrep"
-- Filename, line, col, content
opt.grepformat = "%f:%l:%c:%m"
-- Spell check languages
opt.spelllang = { "en", "pt" }
-- Highlight current cursor line
opt.cursorline = true
-- Always show sign column
opt.signcolumn = "yes"
-- Enable 24-bit colors
opt.termguicolors = true
-- Show column at 100 characters
opt.colorcolumn = "100"
-- Set highlight column color
api.nvim_set_hl(unpack(show_col_config))  
-- Highlight matching brackets
opt.showmatch = true
-- How long to show matching bracket
opt.matchtime = 2
-- Command line height
opt.cmdheight = 1
-- Completion options 
opt.completeopt = "menuone,noinsert,noselect"
-- Don't show mode in command line 
opt.showmode = false
-- Popup menu height 
opt.pumheight = 10
-- Popup menu transparency 
opt.pumblend = 10
-- Floating window transparency 
opt.winblend = 0
-- Don't hide markup 
opt.conceallevel = 0
-- Don't hide cursor line markup 
opt.concealcursor = ""
-- ???
opt.scrolloff = 8
-- ???
opt.sidescrolloff = 8
-- Set GUI cursor
vim.opt.guicursor = gcconf


--[[ Editing ]]

-- Tab width
opt.tabstop = 4
-- Indent width
opt.shiftwidth = 4
-- Soft tab stop
opt.softtabstop = 4
-- Use spaces instead of tabs
opt.expandtab = true
-- Smart auto-indenting
opt.smartindent = true
-- Copy indent from current line
opt.autoindent = true
-- Don't wrap lines (maybe I want this sometimes?)
opt.wrap = false
-- Allow hidden buffers (important for terminal buffers + toggleterm)
opt.hidden = true
-- Don't create backup files
opt.backup = false
-- Don't create backup before writing
opt.writebackup = false
-- Don't create swap files
opt.swapfile = false
-- Persistent undo
opt.undofile = true
-- And the undo dir where it's placed
opt.undodir = util.ensure_dir(undo_dir_path)
-- Auto reload files changed outside vim
opt.autoread = true
-- Don't auto save
opt.autowrite = false
-- Vertical diff splitting
opt.diffopt:append("vertical")  
-- Better diff algo
opt.diffopt:append("algorithm:patience")  
-- Better diff highlight
opt.diffopt:append("linematch:60")  
-- Horizontal splits go below
opt.splitright = true
-- Vertical splits go right
opt.splitbelow = true
-- Use expression for folding
opt.foldmethod = "expr"
-- Use treesitter for folding (vim.wo.vim)
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Start with all folds open
opt.foldlevel = 99


--[[ Search ]]

-- Case insensitive search
opt.ignorecase = true
-- Case sensitive if uppercase in search
opt.smartcase = true
-- Highlight search results!
opt.hlsearch = true
-- Show matches as you type
opt.incsearch = true
-- Add match count to shortmess
opt.shortmess:append({ S = true })


--[[ Behavior ]]

-- Faster, less annoying diags while typing
opt.updatetime = 200
-- Don't redraw during macros
opt.lazyredraw = true
-- Timeout for syntax hl redraw
opt.redrawtime = 10000
-- Memory limits for pattern matching
opt.maxmempattern = 20000
-- Syntax highlighting limit 
opt.synmaxcol = 300
-- Key timeout duration
opt.timeoutlen = 500
-- Key code timeout
opt.ttimeoutlen = 0
-- No error bells
opt.errorbells = false
-- Better backspace behavior
opt.backspace = "indent,eol,start"
-- Don't auto change directory
opt.autochdir = false
-- Treat dash as part of word
opt.iskeyword:append("-")  
-- include subdirectories in search
opt.path:append("**")  
-- Selection excludes cursor
--opt.selection = "exclusive"
-- Selection includes cursor
opt.selection = "inclusive"
-- Enable mouse support
opt.mouse = "a"
-- Use system clipboard
opt.clipboard:append("unnamedplus")  
-- Allow buffer modifications
opt.modifiable = true
-- Set encoding
opt.encoding = "UTF-8"
-- Enable command line completion
opt.wildmenu = true
-- Completion mode for the command line
opt.wildmode = "longest:full:full"
-- Command line completion ignores case
opt.wildignorecase = true
-- ???
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
