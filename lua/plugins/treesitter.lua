----------------------------------------------------------------------------------------------------
-- TITLE : treesitter.lua
-- ABOUT : Setup for built-in treesitter (languages I actually use)
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
----------------------------------------------------------------------------------------------------
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile"},
    lazy = false,
    config = function()
        require "nvim-treesitter.configs".setup {
            -- parsers that MUST be installed from the get-go
            ensure_installed = {
                "lua",
                "python",
                "bash",
                "typescript",
                "javascript",
                "html",
                "css",
                "json",
                "yaml",
                "markdown",
                "dockerfile",
                "markdown_inline",
                "c",
                "cpp",
                "vue",
                "svelte",
                "elixir",
                "heex",
            },
            -- auto-install newly detected parsers
            auto_install = true,
            -- install parsers synchronously (by default applied to ensured only)
            sync_install = false,
            -- highlight options
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- indentation options
            indent = { enable = true },
            -- context-based selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    scope_incremental = "<tab>",
                    node_decremental = "<s-tab>",
                },
            },
        } -- setup end
    end,
}
