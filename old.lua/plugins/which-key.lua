----------------------------------------------------------------------------------------------------
-- TITLE : which-key.lua
-- ABOUT : Help me remember my god damn keymaps.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
----------------------------------------------------------------------------------------------------
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<leader>?",
            function ()
                require "which-key".show { global = false }
            end,
            desc = "Local keymap buffer (which-key)"
        },
    },
}
