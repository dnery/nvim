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
        require "nvim-treesitter.configs".setup({
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
        })
    end,
}
