----------------------------------------------------------------------------------------------------
-- TITLE : nvim-tree.lua
-- ABOUT : Tree-style file explorer that's a bit more up with the times
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
----------------------------------------------------------------------------------------------------
return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        -- Remove bg color from the tree style explorer
        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
        require("nvim-tree").setup({
            filters = {
                dotfiles = false,           -- Show hidden files
            },
            view = {
                adaptive_size = true,       -- Better sizing on tighter spaces
            },
        })
    end,
}





