return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd.colorscheme "nordic"
        local nordic = require("nordic")

        local opt = vim.opt
        local cmd = vim.cmd

        nordic.setup({
            on_highlight = function(highlights, palette)
                highlights.TelescopePromptBorder = {
                    fg = palette.cyan.bright,
                }
            end,
          -- enables italics in code keywords & comments.
          italic_comments = true,
          transparent = {
            -- Enable transparent background.
            bg = true,
            float = true,
          },
            noice = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
        })

        cmd.colorscheme "nordic"
    end
}
