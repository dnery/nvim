----------------------------------------------------------------------------------------------------
-- TITLE : options.lua
-- ABOUT : Basic neovim options, including visuals, search, file handling & performance tweaks
----------------------------------------------------------------------------------------------------

-- vim.cmd.colorscheme("wildcharm")
vim.cmd.colorscheme("elflord")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

----------------------------------------------------------------------------------------------
-- https://raw.githubusercontent.com/radleylewis/nvim-lite/refs/heads/youtube_demo/init.lua --
----------------------------------------------------------------------------------------------

-- Compatibility stuff
if not unpack then
    unpack = table.unpack
end

-- "Show column config"
local scc = {0, "ColorColumn", { bg = "#292929" }}

-- "Undo dir location"
local udl = os.getenv("TEMP") .. "\\undodir"

-- "GUI cusor config"
local gcconf = {
    "n-v-c:block",                                          -- Normal, visual, cli
    "i-ci-ve:block",                                        -- Insert, cli insert, visual-exclusive
    "r-cr:hor20",                                           -- Replace, cli replace
    "o:hor50",                                              -- Operator-pending
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & hl'ing groups
    "sm:block-blinkwait175-blinkoff150-blinkon175",         -- "Showmatch" mode
}

-- Basic settings
vim.opt.number = true                                       -- Line numbers
vim.opt.relativenumber = true                               -- Relative line numbers
vim.opt.cursorline = true                                   -- Highlight current line
vim.opt.wrap = false                                        -- Don't wrap lines
vim.opt.scrolloff = 10                                      -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                                   -- Keep 8 columns left/right of cursor
vim.opt.grepprg = "rg --vimgrep"                            -- Use ripgrep for grepping
vim.opt.grepformat = "%f:%l:%c:%m"                          -- Filename, line, col, content
vim.opt.spelllang = { "en", "pt" }                          -- Spell check languages

-- Indentation
vim.opt.tabstop = 4                                         -- Tab width
vim.opt.shiftwidth = 4                                      -- Indent width
vim.opt.softtabstop = 4                                     -- Soft tab stop
vim.opt.expandtab = true                                    -- Use spaces instead of tabs
vim.opt.smartindent = true                                  -- Smart auto-indenting
vim.opt.autoindent = true                                   -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                                   -- Case insensitive search
vim.opt.smartcase = true                                    -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                                    -- Don't highlight search results **
vim.opt.incsearch = true                                    -- Show matches as you type
vim.opt.shortmess:append({ S = tue })                       -- Add match count to shortmess

-- Visual settings
vim.opt.termguicolors = true                                -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                                  -- Always show sign column
vim.opt.colorcolumn = "100"                                 -- Show column at 100 characters
vim.api.nvim_set_hl(unpack(scc))                            -- Set highlight column color
vim.opt.showmatch = true                                    -- Highlight matching brackets
vim.opt.matchtime = 2                                       -- How long to show matching bracket
vim.opt.cmdheight = 1                                       -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"           -- Completion options 
vim.opt.showmode = false                                    -- Don't show mode in command line 
vim.opt.pumheight = 10                                      -- Popup menu height 
vim.opt.pumblend = 10                                       -- Popup menu transparency 
vim.opt.winblend = 0                                        -- Floating window transparency 
vim.opt.conceallevel = 0                                    -- Don't hide markup 
vim.opt.concealcursor = ""                                  -- Don't hide cursor line markup 
vim.opt.lazyredraw = true                                   -- Don't redraw during macros
vim.opt.redrawtime = 10000                                  -- Timeout for syntax hl redraw
vim.opt.maxmempattern = 20000                               -- Memory limits for pattern matching
vim.opt.synmaxcol = 300                                     -- Syntax highlighting limit 

-- File handling
vim.opt.backup = false                                      -- Don't create backup files
vim.opt.writebackup = false                                 -- Don't create backup before writing
vim.opt.swapfile = false                                    -- Don't create swap files
vim.opt.undofile = true                                     -- Persistent undo
vim.opt.undodir = vim.fn.expand(udl)                        -- Undo directory
if vim.fn.isdirectory(udl) == 0 then
    vim.fn.mkdir(udl, "p")
end
vim.opt.updatetime = 300                                    -- Faster completion
vim.opt.timeoutlen = 500                                    -- Key timeout duration
vim.opt.ttimeoutlen = 0                                     -- Key code timeout
vim.opt.autoread = true                                     -- Auto reload files changed outside vim
vim.opt.autowrite = false                                   -- Don't auto save
vim.opt.diffopt:append("vertical")                          -- Vertical diff splitting
vim.opt.diffopt:append("algorithm:patience")                -- Better diff algo
vim.opt.diffopt:append("linematch:60")                      -- Better diff hl

-- Behavior settings
vim.opt.hidden = true                                       -- Allow hidden buffers
vim.opt.errorbells = false                                  -- No error bells
vim.opt.backspace = "indent,eol,start"                      -- Better backspace behavior
vim.opt.autochdir = false                                   -- Don't auto change directory
-- vim.opt.iskeyword:append("-")                               -- Treat dash as part of word
vim.opt.path:append("**")                                   -- include subdirectories in search
-- vim.opt.selection = "exclusive"                             -- Selection excludes cursor
vim.opt.selection = "inclusive"                             -- Selection includes cursor
vim.opt.mouse = "a"                                         -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")                     -- Use system clipboard
vim.opt.modifiable = true                                   -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                                  -- Set encoding
vim.opt.wildmenu = true                                     -- Enable command line completion
vim.opt.wildmode = "longest:full:full"                      -- Completion mode for the command line
vim.opt.wildignorecase = true                               -- Command line completion ignores case
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Cursor settings
vim.opt.guicursor = gcconf

-- Folding settings
vim.opt.foldmethod = "expr"                                 -- Use expression for folding
-- vim.wo.vim.foldexpr = "v:lua.vim.treesitter.foldexpr()"    -- Use treesitter for folding
vim.opt.foldlevel = 99                                      -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true                                   -- Horizontal splits go below
vim.opt.splitright = true                                   -- Vertical splits go right

-- Shell & terminal emulator (mostly ignored, honestly)
-- vim.opt.shell = "pwsh.exe"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -Command"
-- vim.opt.shellquote = "\""
