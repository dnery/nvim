----------------------------------------------------------------------------------------------------
-- TITLE : webdev-icons.lua
-- ABOUT : Webdev icons for the nvim-tree using our nerd font
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-web-devicons
----------------------------------------------------------------------------------------------------
return {
    "nvim-tree/nvim-web-devicons",
    -- default is 50, but a lot of plugins need this
    priority = 100,
    lazy = false,
    opts = {}
}
