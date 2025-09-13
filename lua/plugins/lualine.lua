----------------------------------------------------------------------------------------------------
-- TITLE : lualine.lua
-- ABOUT : Pretty statusline
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
----------------------------------------------------------------------------------------------------
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require "lualine".setup {
            options = {
                theme = "elflord",
                icons_enabled = true,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            }
        } -- setup ends
    end
}
