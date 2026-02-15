----------------------------------------------------------------------------------------------------
-- TITLE : fzf-lua.lua
-- ABOUT : Fuzzy finder pal
-- LINKS :
--   > github : https://github.com/ibhagwan/fzf-lua
----------------------------------------------------------------------------------------------------
return {
    "ibhagwan/fzf-lua",
    lazy = false,
    -- mini.icons/mini.nvim can be used instead of web-devicons
    -- dependencies = { "nvim-mini/mini.icons" },
    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "fzf files"
        },
        {
            "<leader>fg",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "fzf live-grep"
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "fzf buffers"
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").help_tags()
            end,
            desc = "fzf help docs"
        },
        {
            "<leader>fx",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "fzf over diagnostics"
        },
        {
            "<leader>fX",
            function()
                require("fzf-lua").diagnostics_workspace()
            end,
            desc = "fzf over diagnostics for all workspace"
        },
        {
            "<leader>fs",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            desc = "fzf document symbols"
        },
    },
    opts = {},
}
